/// json_encode_nat_message(msg_type, params_map)
// Creates a JSON string from message type and parameters
// msg_type: MSG_* constant
// params_map: ds_map of key-value pairs (or noone for no params)
// Returns: JSON string ready to send

var msg_type = argument0;
var params = argument1;

var json = '{"ID":' + string(msg_type);

if (params != noone && ds_exists(params, ds_type_map)) {
    var key = ds_map_find_first(params);
    while (!is_undefined(key)) {
        var value = ds_map_find_value(params, key);

        // Add comma before each additional field
        json += ',';

        // Add the key
        json += '"' + string(key) + '":';

        // Add the value (handle strings vs numbers)
        if (is_string(value)) {
            json += '"' + string(value) + '"';
        } else {
            json += string(value);
        }

        key = ds_map_find_next(params, key);
    }
}

json += '}';
return json;
