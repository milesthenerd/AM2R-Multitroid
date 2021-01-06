///strict_compress(input)

/*
    Description:    Returns a compressed version of the provided input string
    Arguments:      input (string)
    Returns:        String
*/

var input, input_size, index, output, ml, dict, verb;

input = argument0;
input_size = string_length(input);
index = 1;
output = "";
ml = _strict_data[? "max_length"];
dict = _strict_data[? "dictionary"];
verb = "";

while(index <= input_size) {
    var l = min(input_size-(index-1),ml);
    var q = "";
    for(var c = l; c > 0; c--) {
        var code = ds_map_find_value(dict,string_copy(input,index,c));
        if(!is_undefined(code)) {
            q += chr(code);
            encoded = true;
            index += c;
            break;
        }
    }
    
    if(q == "") {
        verb += string_char_at(input,index);
        index++;
        if(string_length(verb) == 255) {
            q = strict_encode_verb(verb);
            verb = "";
        }
    }
    else {
        if(verb != "") {
            q = strict_encode_verb(verb) + q;
            verb = "";
        }
    }
    
    output += q;

}

if(verb != "") {
    output += strict_encode_verb(verb);    
}

return output;
