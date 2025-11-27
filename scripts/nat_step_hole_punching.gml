/// nat_step_hole_punching()
// Handles hole punching in Step event
// Call this from oClient Step event when using NAT traversal

if (!use_nat_traversal) exit;

// Only run hole punching if in the PUNCHING state
if (nat_state != NAT_STATE_PUNCHING) exit;

nat_hole_punch_timer++;

// If WE are symmetric, create 256 random UDP sockets (birthday paradox)
if (nat_type == NAT_TYPE_SYMMETRIC && !nat_random_sockets_created) {
    for (var i = 0; i < 256; i++) {
        var random_socket = network_create_socket_ext(network_socket_udp, 0);
        if (random_socket >= 0) {
            ds_list_add(nat_random_sockets, random_socket);
        }
    }
    nat_random_sockets_created = true;
}

// Send hole punch packet every NAT_HOLE_PUNCH_INTERVAL steps
if (nat_hole_punch_timer >= NAT_HOLE_PUNCH_INTERVAL) {
    nat_hole_punch_timer = 0;
    nat_hole_punch_count++;

    // Determine punch strategy based on OUR NAT type and PEER's NAT type
    if (nat_type == NAT_TYPE_SYMMETRIC) {
        // WE are symmetric - send from all 256 random sockets to peer's known port
        // This creates 256 different source ports, leveraging birthday paradox
        var socket_count = ds_list_size(nat_random_sockets);
        for (var i = 0; i < socket_count; i++) {
            var random_socket = ds_list_find_value(nat_random_sockets, i);
            nat_send_hole_punch(random_socket, nat_peer_ip, nat_peer_port);
        }
    } else if (nat_peer_nat_type == NAT_TYPE_SYMMETRIC) {
        // PEER is symmetric - we scan random ports to find their dynamic port
        for (var i = 0; i < 100; i++) {
            var random_port = irandom_range(1024, 65535);
            nat_send_hole_punch(socket, nat_peer_ip, random_port);
        }
    } else {
        // Neither is symmetric - simple bidirectional punch to known port
        nat_send_hole_punch(socket, nat_peer_ip, nat_peer_port);
    }

    // After receiving enough packets, confirm connection (only once)
    if (nat_hole_punch_received >= NAT_HOLE_PUNCH_THRESHOLD && !nat_hole_punch_confirmed) {
        // Send confirmation to mediation server
        var params = ds_map_create();
        ds_map_add(params, "ConnectionID", nat_connection_id);
        ds_map_add(params, "IsServer", false);
        nat_send_tcp_message(mediation_socket, MSG_RECEIVED_PEER, params);
        ds_map_destroy(params);

        nat_hole_punch_confirmed = true;

        // Connection is established - update state
        nat_state = NAT_STATE_CONNECTED;
        server_ip = nat_peer_ip;
        server_port = nat_peer_port;
        isConnected = 1;
        connected = true;  // Mark as connected to prevent duplicate connection flow in Step event

        popup_text("Connected!");

        // If symmetric NAT and we found a successful socket, switch to it NOW before sending initial packet
        if (nat_successful_socket != noone) {
            // Destroy old main socket
            network_destroy(socket);

            // Switch to successful socket
            socket = nat_successful_socket;

            // Clean up remaining random sockets
            for (var i = ds_list_size(nat_random_sockets) - 1; i >= 0; i--) {
                var sock = ds_list_find_value(nat_random_sockets, i);
                network_destroy(sock);
            }
            ds_list_clear(nat_random_sockets);
        }

        // Send initial connection packet to server
        buffer_delete(buffer);
        var size, type, alignment;
        size = 1024;
        type = buffer_grow;
        alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 1);
        buffer_write(buffer, buffer_string, name + "," + global.multitroid_version);
        buffer_write(buffer, buffer_u8, global.sax);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 1);
        buffer_write(buffer, buffer_string, name + "," + global.multitroid_version);
        buffer_write(buffer, buffer_u8, global.sax);
        network_send_udp(socket, server_ip, server_port, buffer, buffer_tell(buffer));

        // Create nametag instance
        instance_create(x, y, oNametag);

        // Disconnect from mediation server
        if (mediation_socket != -1) {
            network_destroy(mediation_socket);
            mediation_socket = -1;
            mediation_connected = false;
        }
    }

    // Timeout after too many attempts
    if (nat_hole_punch_count > 300) {  // 30 seconds
        popup_text("Connection timeout");
        nat_state = NAT_STATE_ERROR;
    }
}
