/// udp_send_reliable(socket, ip, port, buffer, size)
// Send a UDP packet with ACK/retransmission reliability
// Use this for critical packets that must arrive (items, events, etc.)

var sock = argument0;
var ip = argument1;
var port = argument2;
var buff = argument3;
var sz = argument4;

// If oClient doesn't exist, fall back to unreliable send
if (!instance_exists(oClient)) {
    return network_send_udp(sock, ip, port, buff, sz);
}

// Wrap with sequence number for ACK: [254][seq_num (u32)][original_packet]
var seq_num = oClient.next_sequence_number;
oClient.next_sequence_number = (oClient.next_sequence_number + 1) mod 4294967296;

var reliable_buffer = buffer_create(sz + 5, buffer_fixed, 1);
buffer_write(reliable_buffer, buffer_u8, 254);  // Reliable packet marker
buffer_write(reliable_buffer, buffer_u32, seq_num);
buffer_copy(buff, 0, sz, reliable_buffer, 5);

var result = network_send_udp(sock, ip, port, reliable_buffer, sz + 5);

// Track for retransmission on client side
if (is_undefined(oClient.pending_acks)) {
    oClient.pending_acks = ds_map_create();
}

var ack_data = ds_map_create();
ds_map_add(ack_data, "buffer", reliable_buffer);
ds_map_add(ack_data, "size", sz + 5);
ds_map_add(ack_data, "send_time", current_time);
ds_map_add(ack_data, "retransmits", 0);
ds_map_add(ack_data, "ip", ip);
ds_map_add(ack_data, "port", port);
ds_map_add(oClient.pending_acks, seq_num, ack_data);

return result;
