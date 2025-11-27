/// json_parse_nat_message(json_string)
// Parses a JSON message into a ds_map
// json_string: JSON string received from server
// Returns: ds_map with parsed values (caller must destroy!)
// Returns noone if parsing fails

var json_str = argument0;

// Create result map
var result = ds_map_create();

// Basic JSON parser - extracts key-value pairs from {"key":value,"key2":value2}
// This is simplified for our specific use case

// Remove surrounding braces and whitespace
json_str = string_replace_all(json_str, " ", "");
json_str = string_replace_all(json_str, chr(9), "");  // tabs
json_str = string_replace_all(json_str, chr(10), ""); // newlines
json_str = string_replace_all(json_str, chr(13), ""); // carriage returns

if (string_char_at(json_str, 1) == "{") {
    json_str = string_copy(json_str, 2, string_length(json_str) - 2);
}

// Split by commas (but not commas inside quotes)
var in_quotes = false;
var current_pair = "";
var pos = 1;

while (pos <= string_length(json_str)) {
    var ch = string_char_at(json_str, pos);

    if (ch == '"') {
        in_quotes = !in_quotes;
        current_pair += ch;
    } else if (ch == "," && !in_quotes) {
        // Process this key-value pair
        var colon_pos = string_pos(":", current_pair);
        if (colon_pos > 0) {
            var key = string_copy(current_pair, 1, colon_pos - 1);
            var value = string_copy(current_pair, colon_pos + 1, string_length(current_pair) - colon_pos);

            // Remove quotes from key
            key = string_replace_all(key, '"', "");

            // Check if value is a string (has quotes) or number
            if (string_char_at(value, 1) == '"') {
                // String value - remove quotes
                value = string_replace_all(value, '"', "");
                ds_map_add(result, key, value);
            } else {
                // Numeric value
                ds_map_add(result, key, real(value));
            }
        }
        current_pair = "";
    } else {
        current_pair += ch;
    }

    pos++;
}

// Process last pair
if (current_pair != "") {
    var colon_pos = string_pos(":", current_pair);
    if (colon_pos > 0) {
        var key = string_copy(current_pair, 1, colon_pos - 1);
        var value = string_copy(current_pair, colon_pos + 1, string_length(current_pair) - colon_pos);

        key = string_replace_all(key, '"', "");

        if (string_char_at(value, 1) == '"') {
            value = string_replace_all(value, '"', "");
            ds_map_add(result, key, value);
        } else {
            ds_map_add(result, key, real(value));
        }
    }
}

return result;
