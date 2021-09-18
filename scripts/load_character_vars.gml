/// load_character_vars()
global.morphball = 1;
global.jumpball = 0;
global.powergrip = 1;
global.spacejump = 0;
global.screwattack = 0;
global.hijump = 0;
global.spiderball = 0;
global.speedbooster = 0;
global.bomb = 0;
global.ibeam = 0;
global.wbeam = 0;
global.pbeam = 0;
global.sbeam = 0; 
global.cbeam = 0;
global.missiles = 30;
global.missiles = oControl.mod_Mstartingcount;
global.smissiles = 0;
global.pbombs = 0;
global.maxmissiles = 30;
global.maxmissiles = oControl.mod_Mstartingcount;
global.maxsmissiles = 0;
global.maxpbombs = 0;
global.currentweapon = 0;
global.currentsuit = 0;
global.playerhealth = 99;
global.maxhealth = 99;
global.etanks = 0;
global.mtanks = 0;
global.stanks = 0;
global.ptanks = 0;
global.lavastate = 0;
global.timeofday = 0;
i = 100;
repeat (100) {
    i -= 1;
    global.metdead[i] = 0;
}
i = 400;
repeat (400) {
    i -= 1;
    global.event[i] = 0;
}
global.save_room = initroom;
global.monstersleft = 55;
global.monstersarea = 1;
global.progress = 0;
global.gametime = 0;
global.deaths = 0;
global.kills = 0;
global.mapmarker = 0;
global.mapmarkerx = 0;
global.mapmarkery = 0;
global.itemstaken = 0;
i = 350;
repeat (350) {
    i -= 1;
    global.item[i] = 0;
}
global.item[1] = 1;
reset_logs_list();
reset_hints();

if(global.sax && global.saxmode){
    //Upgrades
    global.item[0] = 1;
    global.item[1] = 1;
    global.item[2] = 1;
    global.item[3] = 1;
    global.item[4] = 1;
    global.item[5] = 1;
    global.item[6] = 1;
    global.item[7] = 1;
    global.item[8] = 1;
    global.item[9] = 0;
    global.item[10] = 1;
    global.item[11] = 1;
    global.item[12] = 1;
    global.item[13] = 1;
    global.item[14] = 1;
    
    //E-Tanks
    global.item[50] = 1;
    global.item[103] = 1;
    global.item[108] = 1;
    global.item[157] = 1;
    //M-Tanks
    global.item[52] = 1;
    global.item[53] = 1;
    global.item[54] = 1;
    global.item[55] = 1;
    //S-Tanks
    global.item[51] = 1;
    global.item[110] = 1;
    //P-Tanks
    global.item[58] = 1;
    
    global.morphball = 1;
    global.jumpball = 1;
    global.powergrip = 1;
    global.spacejump = 1;
    global.screwattack = 1;
    global.hijump = 1; 
    global.spiderball = 1;
    global.speedbooster = 1;
    global.bomb = 1;
    global.ibeam = 1;
    global.wbeam = 1;
    global.pbeam = 1;
    global.sbeam = 1;
    global.cbeam = 1;
    global.currentsuit = 1;
    global.etanks = 4;
    global.mtanks = 4;
    global.stanks = 2;
    global.ptanks = 1;
    global.maxhealth = 99 + ((global.etanks * 100) * oControl.mod_etankhealthmult);
    global.playerhealth = global.maxhealth;
    if (global.difficulty < 2) {
        global.maxmissiles = oControl.mod_Mstartingcount + global.mtanks * 5;
        global.maxsmissiles = global.stanks * 2;
        global.maxpbombs = global.ptanks * 2;
    } else {
        global.maxmissiles = oControl.mod_Mstartingcount + global.mtanks * 2;
        global.maxsmissiles = global.stanks;
        global.maxpbombs = global.ptanks;
    }
    global.missiles = global.maxmissiles;
    global.smissiles = global.maxsmissiles;
    global.pbombs = global.maxpbombs;
}

global.dmapPrev = array_clone(global.dmap);

visible = true;
