/// sv6_get_main()
list = ds_list_create();
ds_list_read(list, base64_decode(file_text_read_string(argument0)));
i = 0;
global.save_room = readline();
global.difficulty = readline();
if(!instance_exists(oClient)){
    global.gametime = readline();
    global.itemstaken = readline();
    global.etanks = readline();
    global.mtanks = readline();
    global.stanks = readline();
    global.ptanks = readline();
    global.monstersleft = readline();
    global.monstersarea = readline();
    global.lavastate = readline();
    global.mapmarker = readline();
    global.mapmarkerx = readline();
    global.mapmarkery = readline();
} else if(instance_exists(oClient) && global.lastroom == gameoverroom){
    //don't reset values
    refill_heath_ammo();
} else if(instance_exists(oClient) && global.lastroom != gameoverroom && string_count("rm_a", room_get_name(global.lastroom)) == 0){
    global.gametime = readline();
    global.itemstaken = readline();
    global.etanks = readline();
    global.mtanks = readline();
    global.stanks = readline();
    global.ptanks = readline();
    global.monstersleft = readline();
    global.monstersarea = readline();
    global.lavastate = readline();
    global.mapmarker = readline();
    global.mapmarkerx = readline();
    global.mapmarkery = readline();
} else if(instance_exists(oClient) && global.lastroom != gameoverroom && string_count("rm_a", room_get_name(global.lastroom)) > 0){
    //don't reset values
    refill_heath_ammo();
}

ds_list_clear(list);
