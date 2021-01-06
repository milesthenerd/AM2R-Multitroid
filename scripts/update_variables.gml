/// update_variables
switch(argument0){
    case "prev":
        global.itemPrev = array_clone(global.item);
        global.itemstakenPrev = global.itemstaken;
        global.metdeadPrev = array_clone(global.metdead);
        global.eventPrev = array_clone(global.event);
        global.monstersleftPrev = global.monstersleft;
        global.maxmissilesPrev = global.maxmissiles;
        global.maxsmissilesPrev = global.maxsmissiles;
        global.maxpbombsPrev = global.maxpbombs;
        global.maxhealthPrev = global.maxhealth;
        global.playerhealthPrev = global.playerhealth;
        global.morphballPrev = global.morphball;
        global.jumpballPrev = global.jumpball;
        global.powergripPrev = global.powergrip;
        global.spacejumpPrev = global.spacejump;
        global.screwattackPrev = global.screwattack;
        global.hijumpPrev = global.hijump;
        global.spiderballPrev = global.spiderball;
        global.speedboosterPrev = global.speedbooster;
        global.bombPrev = global.bomb;
        global.ibeamPrev = global.ibeam;
        global.wbeamPrev = global.wbeam;
        global.pbeamPrev = global.pbeam;
        global.sbeamPrev = global.sbeam;
        global.cbeamPrev = global.cbeam;
        global.missilesPrev = global.missiles;
        global.smissilesPrev = global.smissiles;
        global.pbombsPrev = global.pbombs;
        global.etanksPrev = global.etanks;
        global.mtanksPrev = global.mtanks;
        global.stanksPrev = global.stanks;
        global.ptanksPrev = global.ptanks;
        global.currentsuitPrev = global.currentsuit;
        global.monstersareaPrev = global.monstersarea;
        break;
    case "onlinevars":
        ds_grid_set(global.onlineList, 0, 0, global.itemPrev);
        ds_grid_set(global.onlineList, 1, 0, global.item);
        ds_grid_set(global.onlineList, 0, 1, global.metdeadPrev);
        ds_grid_set(global.onlineList, 1, 1, global.metdead);
        ds_grid_set(global.onlineList, 0, 2, global.itemstakenPrev);
        ds_grid_set(global.onlineList, 1, 2, global.itemstaken);
        ds_grid_set(global.onlineList, 0, 3, global.eventPrev);
        ds_grid_set(global.onlineList, 1, 3, global.event);
        ds_grid_set(global.onlineList, 0, 4, global.monstersleftPrev);
        ds_grid_set(global.onlineList, 1, 4, global.monstersleft);
        ds_grid_set(global.onlineList, 0, 5, global.maxmissilesPrev);
        ds_grid_set(global.onlineList, 1, 5, global.maxmissiles);
        ds_grid_set(global.onlineList, 0, 6, global.maxsmissilesPrev);
        ds_grid_set(global.onlineList, 1, 6, global.maxsmissiles);
        ds_grid_set(global.onlineList, 0, 7, global.maxpbombsPrev);
        ds_grid_set(global.onlineList, 1, 7, global.maxpbombs);
        ds_grid_set(global.onlineList, 0, 8, global.maxhealthPrev);
        ds_grid_set(global.onlineList, 1, 8, global.maxhealth);
        ds_grid_set(global.onlineList, 0, 9, global.playerhealthPrev);
        ds_grid_set(global.onlineList, 1, 9, global.playerhealth);
        ds_grid_set(global.onlineList, 0, 10, global.morphballPrev);
        ds_grid_set(global.onlineList, 1, 10, global.morphball);
        ds_grid_set(global.onlineList, 0, 11, global.jumpballPrev);
        ds_grid_set(global.onlineList, 1, 11, global.jumpball);
        ds_grid_set(global.onlineList, 0, 12, global.powergripPrev);
        ds_grid_set(global.onlineList, 1, 12, global.powergrip);
        ds_grid_set(global.onlineList, 0, 13, global.spacejumpPrev);
        ds_grid_set(global.onlineList, 1, 13, global.spacejump);
        ds_grid_set(global.onlineList, 0, 14, global.screwattackPrev);
        ds_grid_set(global.onlineList, 1, 14, global.screwattack);
        ds_grid_set(global.onlineList, 0, 15, global.hijumpPrev);
        ds_grid_set(global.onlineList, 1, 15, global.hijump);
        ds_grid_set(global.onlineList, 0, 16, global.spiderballPrev);
        ds_grid_set(global.onlineList, 1, 16, global.spiderball);
        ds_grid_set(global.onlineList, 0, 17, global.speedboosterPrev);
        ds_grid_set(global.onlineList, 1, 17, global.speedbooster);
        ds_grid_set(global.onlineList, 0, 18, global.bombPrev);
        ds_grid_set(global.onlineList, 1, 18, global.bomb);
        ds_grid_set(global.onlineList, 0, 19, global.ibeamPrev);
        ds_grid_set(global.onlineList, 1, 19, global.ibeam);
        ds_grid_set(global.onlineList, 0, 20, global.wbeamPrev);
        ds_grid_set(global.onlineList, 1, 20, global.wbeam);
        ds_grid_set(global.onlineList, 0, 21, global.pbeamPrev);
        ds_grid_set(global.onlineList, 1, 21, global.pbeam);
        ds_grid_set(global.onlineList, 0, 22, global.sbeamPrev);
        ds_grid_set(global.onlineList, 1, 22, global.sbeam);
        ds_grid_set(global.onlineList, 0, 23, global.cbeamPrev);
        ds_grid_set(global.onlineList, 1, 23, global.cbeam);
        ds_grid_set(global.onlineList, 0, 24, global.missilesPrev);
        ds_grid_set(global.onlineList, 1, 24, global.missiles);
        ds_grid_set(global.onlineList, 0, 25, global.smissilesPrev);
        ds_grid_set(global.onlineList, 1, 25, global.smissiles);
        ds_grid_set(global.onlineList, 0, 26, global.pbombsPrev);
        ds_grid_set(global.onlineList, 1, 26, global.pbombs);
        ds_grid_set(global.onlineList, 0, 27, global.etanksPrev);
        ds_grid_set(global.onlineList, 1, 27, global.etanks);
        ds_grid_set(global.onlineList, 0, 28, global.mtanksPrev);
        ds_grid_set(global.onlineList, 1, 28, global.mtanks);
        ds_grid_set(global.onlineList, 0, 29, global.stanksPrev);
        ds_grid_set(global.onlineList, 1, 29, global.stanks);
        ds_grid_set(global.onlineList, 0, 30, global.ptanksPrev);
        ds_grid_set(global.onlineList, 1, 30, global.ptanks);
        ds_grid_set(global.onlineList, 0, 31, global.currentsuitPrev);
        ds_grid_set(global.onlineList, 1, 31, global.currentsuit);
        ds_grid_set(global.onlineList, 0, 32, global.monstersareaPrev);
        ds_grid_set(global.onlineList, 1, 32, global.monstersarea);
        break;
        /*
    case "onlinevarscurrent":
        ds_grid_set(global.onlineList, 1, 0, global.item);
        ds_grid_set(global.onlineList, 1, 1, global.metdead);
        ds_grid_set(global.onlineList, 1, 2, global.itemstaken);
        ds_grid_set(global.onlineList, 1, 3, global.event);
        ds_grid_set(global.onlineList, 1, 4, global.monstersleft);
        ds_grid_set(global.onlineList, 1, 5, global.maxmissiles);
        ds_grid_set(global.onlineList, 1, 6, global.maxsmissiles);
        ds_grid_set(global.onlineList, 1, 7, global.maxpbombs);
        ds_grid_set(global.onlineList, 1, 8, global.maxhealth);
        ds_grid_set(global.onlineList, 1, 9, global.playerhealth);
        ds_grid_set(global.onlineList, 1, 10, global.morphball);
        ds_grid_set(global.onlineList, 1, 11, global.jumpball);
        ds_grid_set(global.onlineList, 1, 12, global.powergrip);
        ds_grid_set(global.onlineList, 1, 13, global.spacejump);
        ds_grid_set(global.onlineList, 1, 14, global.screwattack);
        ds_grid_set(global.onlineList, 1, 15, global.hijump);
        ds_grid_set(global.onlineList, 1, 16, global.spiderball);
        ds_grid_set(global.onlineList, 1, 17, global.speedbooster);
        ds_grid_set(global.onlineList, 1, 18, global.bomb);
        ds_grid_set(global.onlineList, 1, 19, global.ibeam);
        ds_grid_set(global.onlineList, 1, 20, global.wbeam);
        ds_grid_set(global.onlineList, 1, 21, global.pbeam);
        ds_grid_set(global.onlineList, 1, 22, global.sbeam);
        ds_grid_set(global.onlineList, 1, 23, global.cbeam);
        ds_grid_set(global.onlineList, 1, 24, global.missiles);
        ds_grid_set(global.onlineList, 1, 25, global.smissiles);
        ds_grid_set(global.onlineList, 1, 26, global.pbombs);
        ds_grid_set(global.onlineList, 1, 27, global.etanks);
        ds_grid_set(global.onlineList, 1, 28, global.mtanks);
        ds_grid_set(global.onlineList, 1, 29, global.stanks);
        ds_grid_set(global.onlineList, 1, 30, global.ptanks);
        ds_grid_set(global.onlineList, 1, 31, global.currentsuit);
        ds_grid_set(global.onlineList, 1, 32, global.monstersarea);
        break;
    case "onlinevarsprev":
        ds_grid_set(global.onlineList, 0, 0, global.itemPrev);
        ds_grid_set(global.onlineList, 0, 1, global.metdeadPrev);
        ds_grid_set(global.onlineList, 0, 2, global.itemstakenPrev);
        ds_grid_set(global.onlineList, 0, 3, global.eventPrev);
        ds_grid_set(global.onlineList, 0, 4, global.monstersleftPrev);
        ds_grid_set(global.onlineList, 0, 5, global.maxmissilesPrev);
        ds_grid_set(global.onlineList, 0, 6, global.maxsmissilesPrev);
        ds_grid_set(global.onlineList, 0, 7, global.maxpbombsPrev);
        ds_grid_set(global.onlineList, 0, 8, global.maxhealthPrev);
        ds_grid_set(global.onlineList, 0, 9, global.playerhealthPrev);
        ds_grid_set(global.onlineList, 0, 10, global.morphballPrev);
        ds_grid_set(global.onlineList, 0, 11, global.jumpballPrev);
        ds_grid_set(global.onlineList, 0, 12, global.powergripPrev);
        ds_grid_set(global.onlineList, 0, 13, global.spacejumpPrev);
        ds_grid_set(global.onlineList, 0, 14, global.screwattackPrev);
        ds_grid_set(global.onlineList, 0, 15, global.hijumpPrev);
        ds_grid_set(global.onlineList, 0, 16, global.spiderballPrev);
        ds_grid_set(global.onlineList, 0, 17, global.speedboosterPrev);
        ds_grid_set(global.onlineList, 0, 18, global.bombPrev);
        ds_grid_set(global.onlineList, 0, 19, global.ibeamPrev);
        ds_grid_set(global.onlineList, 0, 20, global.wbeamPrev);
        ds_grid_set(global.onlineList, 0, 21, global.pbeamPrev);
        ds_grid_set(global.onlineList, 0, 22, global.sbeamPrev);
        ds_grid_set(global.onlineList, 0, 23, global.cbeamPrev);
        ds_grid_set(global.onlineList, 0, 24, global.missilesPrev);
        ds_grid_set(global.onlineList, 0, 25, global.smissilesPrev);
        ds_grid_set(global.onlineList, 0, 26, global.pbombsPrev);
        ds_grid_set(global.onlineList, 0, 27, global.etanksPrev);
        ds_grid_set(global.onlineList, 0, 28, global.mtanksPrev);
        ds_grid_set(global.onlineList, 0, 29, global.stanksPrev);
        ds_grid_set(global.onlineList, 0, 30, global.ptanksPrev);
        ds_grid_set(global.onlineList, 0, 31, global.currentsuitPrev);
        ds_grid_set(global.onlineList, 0, 32, global.monstersareaPrev);
        break;
        */
    case "replaceglobalvars":
        global.item = ds_grid_get(global.onlineList, 1, 0);
        global.metdead = ds_grid_get(global.onlineList, 1, 1);
        global.itemstaken = ds_grid_get(global.onlineList, 1, 2);
        global.event = ds_grid_get(global.onlineList, 1, 3);
        global.monstersleft = ds_grid_get(global.onlineList, 1, 4);
        global.maxmissiles = ds_grid_get(global.onlineList, 1, 5);
        global.maxsmissiles = ds_grid_get(global.onlineList, 1, 6);
        global.maxpbombs = ds_grid_get(global.onlineList, 1, 7);
        global.maxhealth = ds_grid_get(global.onlineList, 1, 8);
        global.playerhealth = ds_grid_get(global.onlineList, 1, 9);
        global.morphball = ds_grid_get(global.onlineList, 1, 10);
        global.jumpball = ds_grid_get(global.onlineList, 1, 11);
        global.powergrip = ds_grid_get(global.onlineList, 1, 12);
        global.spacejump = ds_grid_get(global.onlineList, 1, 13);
        global.screwattack = ds_grid_get(global.onlineList, 1, 14);
        global.hijump = ds_grid_get(global.onlineList, 1, 15);
        global.spiderball = ds_grid_get(global.onlineList, 1, 16);
        global.speedbooster = ds_grid_get(global.onlineList, 1, 17);
        global.bomb = ds_grid_get(global.onlineList, 1, 18);
        global.ibeam = ds_grid_get(global.onlineList, 1, 19);
        global.wbeam = ds_grid_get(global.onlineList, 1, 20);
        global.pbeam = ds_grid_get(global.onlineList, 1, 21);
        global.sbeam = ds_grid_get(global.onlineList, 1, 22);
        global.cbeam = ds_grid_get(global.onlineList, 1, 23);
        global.missiles = ds_grid_get(global.onlineList, 1, 24);
        global.smissiles = ds_grid_get(global.onlineList, 1, 25);
        global.pbombs = ds_grid_get(global.onlineList, 1, 26);
        global.etanks = ds_grid_get(global.onlineList, 1, 27);
        global.mtanks = ds_grid_get(global.onlineList, 1, 28);
        global.stanks = ds_grid_get(global.onlineList, 1, 29);
        global.ptanks = ds_grid_get(global.onlineList, 1, 30);
        global.currentsuit = ds_grid_get(global.onlineList, 1, 31);
        global.monstersarea = ds_grid_get(global.onlineList, 1, 32);
        break;
    case "disablesame":
        for(var i=0; i<ds_grid_height(global.onlineSend); i++){
            if(global.onlineSend[# 2, i] != 0){
                global.onlineList[# 1, i] = global.onlineSend[# 1, i];
            }
        }
        break;
        /*
    case "item":
        show_debug_message("item");
        for(var i=0; i<array_length_1d(global.item); i++){
            show_debug_message(string(global.itemPrev[i]) + " " + string(global.item[i]));
            if(global.itemPrev[i] != global.item[i]){
                global.onlineSend[# 0, 0] = global.onlineList[# 0, 0];
                global.onlineSend[# 1, 0] = global.onlineList[# 1, 0];
                global.onlineSend[# 2, 0] = global.onlineList[# 2, 0];
                show_debug_message("item changed");
                return;
            }
        }
        break;
    case "event":
        show_debug_message("event");    
        for(var i=0; i<array_length_1d(global.event); i++){
            show_debug_message(string(global.eventPrev[i]) + " " + string(global.event[i]));
            if(global.eventPrev[i] != global.event[i]){
                global.onlineSend[# 0, 3] = global.onlineList[# 0, 3];
                global.onlineSend[# 1, 3] = global.onlineList[# 1, 3];
                global.onlineSend[# 2, 3] = global.onlineList[# 2, 3];
                show_debug_message("event changed");
                return;
            }
        }
        break;
    case "metdead":
        show_debug_message("metdead");
        for(var i=0; i<array_length_1d(global.metdead); i++){
            show_debug_message(string(global.metdeadPrev[i]) + " " + string(global.metdead[i]));
            if(global.metdeadPrev[i] != global.metdead[i]){
                global.onlineSend[# 0, 1] = global.onlineList[# 0, 1];
                global.onlineSend[# 1, 1] = global.onlineList[# 1, 1];
                global.onlineSend[# 2, 1] = global.onlineList[# 2, 1];
                show_debug_message("metdead changed");
                return;
            }
        }
        break;
        */
}

