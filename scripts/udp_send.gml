/// udp_send(socket, ip, port, buffer, size)
// Wrapper for network_send_udp - drop-in replacement for network_send_packet
// Use this instead of network_send_packet for UDP client connections

var sock = argument0;
var ip = argument1;
var port = argument2;
var buff = argument3;
var sz = argument4;

return network_send_udp(sock, ip, port, buff, sz);
