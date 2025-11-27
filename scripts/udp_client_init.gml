/// udp_client_init(server_ip, server_port)
// Initialize UDP client for connecting to proxy server
// Returns socket ID

var ip = argument0;
var port = argument1;

// Create UDP socket
var sock = network_create_socket_ext(network_socket_udp, port);

// Initialize client data structures
global.udp_client_socket = sock;
global.udp_client_server_ip = ip;
global.udp_client_server_port = port;

// Fragment reassembly
global.fragment_buffers = ds_map_create();
global.fragment_timestamps = ds_map_create();
global.FRAGMENT_TIMEOUT = 5000;
global.UDP_MAX_FRAGMENT_SIZE = 1400;

// Reliable UDP with ACK
global.received_sequences = ds_map_create();
global.SEQUENCE_CACHE_SIZE = 1000;

return sock;
