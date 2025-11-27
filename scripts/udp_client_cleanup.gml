/// udp_client_cleanup()
// Clean up client UDP resources

// Clean up fragment buffers
var frag_id = ds_map_find_first(global.fragment_buffers);
while (!is_undefined(frag_id)) {
    var frag_map = ds_map_find_value(global.fragment_buffers, frag_id);
    var frag_idx = ds_map_find_first(frag_map);
    while (!is_undefined(frag_idx)) {
        var frag_buffer = ds_map_find_value(frag_map, frag_idx);
        if (is_real(frag_buffer) && buffer_exists(frag_buffer)) {
            buffer_delete(frag_buffer);
        }
        frag_idx = ds_map_find_next(frag_map, frag_idx);
    }
    ds_map_destroy(frag_map);
    frag_id = ds_map_find_next(global.fragment_buffers, frag_id);
}

ds_map_destroy(global.fragment_buffers);
ds_map_destroy(global.fragment_timestamps);
ds_map_destroy(global.received_sequences);
