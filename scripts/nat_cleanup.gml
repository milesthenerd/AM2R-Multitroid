/// nat_cleanup()
// Cleans up NAT traversal resources
// Call this in oClient Destroy event

if (mediation_socket != -1) {
    network_destroy(mediation_socket);
    mediation_socket = -1;
}

// Clean up random sockets for symmetric NAT
if (ds_exists(nat_random_sockets, ds_type_list)) {
    for (var i = ds_list_size(nat_random_sockets) - 1; i >= 0; i--) {
        var sock = ds_list_find_value(nat_random_sockets, i);
        network_destroy(sock);
    }
    ds_list_destroy(nat_random_sockets);
}

mediation_connected = false;
nat_state = NAT_STATE_DISCONNECTED;
nat_type = NAT_TYPE_UNKNOWN;

show_debug_message("NAT client cleaned up");
