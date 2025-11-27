/// udp_send_unreliable(socket, ip, port, buffer, size)
// Send a UDP packet without reliability (fast, no ACK needed)
// Use this for frequent updates where latest data is most important (positions, etc.)

var sock = argument0;
var ip = argument1;
var port = argument2;
var buff = argument3;
var sz = argument4;

return network_send_udp(sock, ip, port, buff, sz);
