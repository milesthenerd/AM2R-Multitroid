///strict_decompress(input)

/*
    Description:    Returns a decompressed version of the provided input string
    Arguments:      input (string)
    Returns:        String
*/

var input, input_size, output, index, ml, inv_dict;

input = argument0;
input_size = string_length(input);
output = "";
index = 1;
ml = _strict_data[? "max_length"];
inv_dict = _strict_data[? "inv_dictionary"];

while(index <= input_size) {
    var char = string_ord_at(input,index);
    if(char == 255) {
        var n = string_ord_at(input,index+1);
        output += string_copy(input,index+2,n);
        index += n + 2;
    }
    else if(char == 254) {
        output += string_char_at(input,index+1);
        index += 2;
    }
    else {
        output += inv_dict[| char];
        index++;
    }
}

return output;
