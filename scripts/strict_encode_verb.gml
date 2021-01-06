///strict_encode_verb(verb)

/*
    Description:    (called from strict_compress). Returns an encoded verb ready to be added to a compressed output
    Arguments:      verb (string)
    Returns:        String
*/

var verb = argument0;
var verb_length = string_length(verb);

if(verb_length > 1) {
    return chr(255) + chr(verb_length) + verb;
}
else {
    return chr(254) + verb;
}
