/// nat_connect_mediation()
// Connects to mediation server and starts NAT detection
// Call this when client wants to use NAT traversal

if (!use_nat_traversal) {
    show_debug_message("NAT traversal not enabled");
    exit;
}

if (mediation_socket != -1) {
    show_debug_message("Already connected to mediation server");
    exit;
}

// Create TCP connection to mediation server
mediation_socket = network_create_socket(network_socket_tcp);
var result = network_connect_raw(mediation_socket, mediation_server_ip, mediation_server_port);

if (result >= 0) {
    nat_state = NAT_STATE_CONNECTING;
    show_debug_message("NAT: Connecting to mediation server at " + mediation_server_ip + ":" + string(mediation_server_port));
    popup_text("Starting NAT traversal...");
} else {
    show_debug_message("NAT: Failed to connect to mediation server");
    network_destroy(mediation_socket);
    mediation_socket = -1;
    nat_state = NAT_STATE_ERROR;
    popup_text("NAT connection failed");
}
