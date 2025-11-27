/// nat_send_hole_punch(udp_socket, target_ip, target_port)
// Sends a UDP hole punch packet to peer
// udp_socket: UDP socket ID
// target_ip: Peer's IP address
// target_port: Peer's UDP port

var udp_socket = argument0;
var target_ip = argument1;
var target_port = argument2;

// Create simple hole punch message
var params = ds_map_create();
var json_str = json_encode_nat_message(MSG_HOLE_PUNCH_ATTEMPT, params);
ds_map_destroy(params);

// Send as UDP
var buf = buffer_create(string_length(json_str) + 1, buffer_fixed, 1);
buffer_seek(buf, buffer_seek_start, 0);
buffer_write(buf, buffer_text, json_str);

network_send_udp_raw(udp_socket, target_ip, target_port, buf, buffer_tell(buf));

buffer_delete(buf);
