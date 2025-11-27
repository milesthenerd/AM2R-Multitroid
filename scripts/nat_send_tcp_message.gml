/// nat_send_tcp_message(tcp_socket, msg_type, params_map)
// Sends a JSON message over TCP to mediation server
// tcp_socket: TCP socket ID
// msg_type: MSG_* constant
// params_map: ds_map of parameters (or noone)

var tcp_socket = argument0;
var msg_type = argument1;
var params = argument2;

// Encode to JSON
var json_str = json_encode_nat_message(msg_type, params);

// Create buffer with JSON string
var buf = buffer_create(string_length(json_str) + 1, buffer_fixed, 1);
buffer_seek(buf, buffer_seek_start, 0);
buffer_write(buf, buffer_text, json_str);

// Send over TCP
network_send_packet(tcp_socket, buf, buffer_tell(buf));

// Clean up
buffer_delete(buf);
