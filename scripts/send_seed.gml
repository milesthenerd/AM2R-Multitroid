/// send_seed
var size, type, alignment;
size = 1024;
type = buffer_grow;
alignment = 1;
seedBuffer = buffer_create(size, type, alignment);
buffer_seek(seedBuffer, buffer_seek_start, 0);
buffer_write(seedBuffer, buffer_u8, 3);
buffer_write(seedBuffer, buffer_f64, oControl.seed);
buffer_write(seedBuffer, buffer_u8, global.clientID);
var bufferSize = buffer_tell(seedBuffer);
buffer_seek(seedBuffer, buffer_seek_start, 0);
buffer_write(seedBuffer, buffer_s32, bufferSize);
buffer_write(seedBuffer, buffer_u8, 3);
buffer_write(seedBuffer, buffer_f64, oControl.seed);
buffer_write(seedBuffer, buffer_u8, global.clientID);
var result = network_send_packet(oClient.socket, seedBuffer, buffer_tell(seedBuffer));
popup_text("Seed sent");
