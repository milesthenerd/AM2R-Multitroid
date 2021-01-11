/// create_buffer
buffer_delete(buffer);
var size, type, alignment;
size = 1024;
type = buffer_grow;
alignment = 1;
buffer = buffer_create(size, type, alignment);
return buffer;
