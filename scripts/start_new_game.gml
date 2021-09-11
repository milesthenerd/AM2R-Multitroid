/// start_new_game()
global.start_room = rm_a0h01;
global.save_x = 3408;
global.save_y = 1184;
if(global.saxmode && global.sax){
    global.start_room = rm_a8h02;
    global.save_x = 144;
    global.save_y = 176;
}
global.ingame = 1;
global.timeofday = 0;
reset_map();
init_map();
load_character_vars();
file_delete(working_directory + "\multitroid\random" + string(global.saveslot + 1) + ".ini"); //This is only here for old file cleanup.
file_delete(working_directory + "\multitroid\save" + string(global.saveslot + 1) + ".dat");
scr_newgame();

save_game(working_directory + "\multitroid\save" + string(global.saveslot + 1));
room_change(global.start_room, 0);
