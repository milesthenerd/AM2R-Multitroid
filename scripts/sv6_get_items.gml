/// sv6_get_items()
list = ds_list_create();
ds_list_read(list, base64_decode(file_text_read_string(argument0)));
i = 0;
j = 0;

if(!instance_exists(oClient)){
    repeat (350) {
        global.item[j] = readline();
        j += 1;
    }
} else if(instance_exists(oClient) && global.lastroom == gameoverroom){
    //don't reset values
} else if(instance_exists(oClient) && global.lastroom != gameoverroom){
    repeat (350) {
        global.item[j] = readline();
        j += 1;
    }
}

ds_list_clear(list);
