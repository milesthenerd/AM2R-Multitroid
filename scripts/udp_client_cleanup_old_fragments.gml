/// udp_client_cleanup_old_fragments()
// Clean up incomplete fragment packets that have timed out
// Call this in Step event

var current = current_time;
var frag_id = ds_map_find_first(global.fragment_timestamps);

while (!is_undefined(frag_id)) {
    var next_id = ds_map_find_next(global.fragment_timestamps, frag_id);
    var timestamp = ds_map_find_value(global.fragment_timestamps, frag_id);
    
    // If fragment is older than timeout, clean it up
    if (current - timestamp > global.FRAGMENT_TIMEOUT) {
        // Clean up the fragment buffers
        if (ds_map_exists(global.fragment_buffers, frag_id)) {
            var frag_map = ds_map_find_value(global.fragment_buffers, frag_id);
            var total = ds_map_find_value(frag_map, "total");
            
            // Delete any stored fragment buffers
            for (var i = 0; i < total; i++) {
                if (ds_map_exists(frag_map, i)) {
                    var frag_buf = ds_map_find_value(frag_map, i);
                    buffer_delete(frag_buf);
                }
            }
            
            ds_map_destroy(frag_map);
            ds_map_delete(global.fragment_buffers, frag_id);
        }
        
        ds_map_delete(global.fragment_timestamps, frag_id);
    }
    
    frag_id = next_id;
}
