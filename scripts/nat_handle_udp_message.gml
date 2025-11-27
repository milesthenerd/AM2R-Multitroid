/// nat_handle_udp_message(buffer, sender_ip, sender_port, receiving_socket)
// Handles incoming UDP messages that might be hole punch packets
// Call this from Async Networking event for UDP messages
// receiving_socket: The socket that received this packet (to detect random socket success)
// Returns true if it was a NAT message, false otherwise

var buf = argument0;
var sender_ip = argument1;
var sender_port = argument2;
var receiving_socket = argument3;

// Only process if we're in hole punching state
if (nat_state != NAT_STATE_PUNCHING) {
    return false;
}

// During hole punching, count ANY packet from the expected peer IP as successful hole punch
// This is because the server may transition to sending game protocol before we've received enough packets
if (sender_ip == nat_peer_ip) {
    nat_hole_punch_received++;

    // Update peer port if different
    if (sender_port != nat_peer_port) {
        nat_peer_port = sender_port;
    }

    // If we're symmetric NAT and received on one of our random sockets, note it but DON'T replace yet
    // We'll switch after hole punching completes to avoid losing async events
    if (nat_type == NAT_TYPE_SYMMETRIC && receiving_socket != socket) {
        // Check if this is one of our random sockets
        var socket_index = ds_list_find_index(nat_random_sockets, receiving_socket);
        if (socket_index >= 0 && nat_successful_socket == noone) {
            // Remember which socket succeeded, but don't switch yet
            nat_successful_socket = receiving_socket;

            // Remove from random sockets list so we don't destroy it
            ds_list_delete(nat_random_sockets, socket_index);
        }
    }

    // Return true to indicate we handled this packet during hole punching
    return true;
}

// Not from expected peer during hole punching - ignore
return false;
