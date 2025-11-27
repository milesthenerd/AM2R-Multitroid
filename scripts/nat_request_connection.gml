/// nat_request_connection()
// Requests connection to game server through mediation server
// Call this after NAT type is detected

if (nat_state != NAT_STATE_WAITING) {
    show_debug_message("NAT: Cannot request connection - not in WAITING state");
    exit;
}

// Send connection request to mediation server
var params = ds_map_create();
ds_map_add(params, "EndpointString", server_ip);  // The game server IP we want to connect to
ds_map_add(params, "NATType", nat_type);
nat_send_tcp_message(mediation_socket, MSG_CONNECTION_REQUEST, params);
ds_map_destroy(params);

show_debug_message("NAT: Sent connection request for server " + server_ip);
