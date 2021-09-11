/// draw_character_ext(sprite, x, y, sprite2, s2ox, s2oy, sprite3, s3ox, s3oy, s3angle, facing, color, alpha, s3show, arrID)
var ID = argument15;
global.otherBeingAbsorbed = false;
global.absorbX = -100;
global.absorbY = -100;
global.absorbScaleX = 1;
global.absorbScaleY = 1;

if(global.shaders_compiled && os_type != os_android){
    if ((oControl.mod_fusion) && (!oControl.msr_fusionsuit)) { // Fusion suit
        if (global.currentsuit == 0) { // Power
            pal_swap_set(sPalFusion0, 1, false);
        } else if (global.currentsuit == 1) { // Varia
            pal_swap_set(sPalFusion1, 1, false);
        } else if (global.currentsuit == 2) { // Gravity
            pal_swap_set(sPalFusion2, 1, false);
        }
    } else { // Custom color swaps
        if (global.currentsuit == 0) { // Power
            pal_swap_set(oControl.PowerPalette, 1, false);
        } else if (global.currentsuit == 1) { // Varia
            pal_swap_set(oControl.VariaPalette, 1, false);
        } else if (global.currentsuit == 2) { // Gravity
            pal_swap_set(oControl.GravityPalette, 1, false);
        }
    }
}

if(global.shaders_compiled && os_type != os_android && string_count("Frozen", sprite_get_name(argument0)) == 0){
    if((oControl.mod_fusion && !global.saxmode) || (global.saxmode && !global.otherSAX)){
        pal_swap_set(oControl.MultitroidPaletteFusion, ID, false);
    } else {
        pal_swap_set(oControl.MultitroidPalette, ID, false);
    }
}

if(global.otherSAX && global.otherMosaic){
    if(argument0 == sCoreXSAX){
        sizeX = sizeX - 0.18;
        sizeY = sizeY - 0.12;
    } else {
        sizeX = sizeX + 0.18;
        sizeY = sizeY + 0.12;
    }
    draw_sprite_pixelated(argument0, argument14, argument1, argument2, argument10, 1, 0, c_white, 1, sizeX, sizeY, 64);
    if(sizeX < 1) sizeX = 1;
    if(sizeY < 1) sizeY = 1;
    if(global.shaders_compiled && os_type != os_android){
        pal_swap_reset();
    }
    exit;
}

if(global.otherSAX && global.otherReform){
    if(argument0 == sCoreXSAX){
        sizeX = sizeX + 0.18;
        sizeY = sizeY + 0.12;
    } else {
        sizeX = sizeX - 0.18;
        sizeY = sizeY - 0.12;
    }
    draw_sprite_pixelated(argument0, argument14, argument1, argument2, argument10, 1, 0, c_white, 1, sizeX, sizeY, 64);
    if(sizeX < 1) sizeX = 1;
    if(sizeY < 1) sizeY = 1;
    if(global.shaders_compiled && os_type != os_android){
        pal_swap_reset();
    }
    exit;
}

if(instance_exists(oMultiHitbox)){
    with(oMultiHitbox){
        if(absorb && myid == ID){
            global.otherBeingAbsorbed = true;
            global.absorbX = x;
            global.absorbY = y;
            global.absorbScaleX = image_xscale;
            global.absorbScaleY = image_yscale;
        }
    }
}

if(global.otherBeingAbsorbed){
    draw_sprite_ext(argument0, argument14, global.absorbX, global.absorbY, global.absorbScaleX, global.absorbScaleY, 0, argument11, argument12);
    draw_sprite_ext(argument3, argument14, argument1 + global.absorbX, global.absorbY + argument5, global.absorbScaleX, global.absorbScaleY, 0, argument11, argument12);
} else {
    draw_sprite_ext(argument0, argument14, argument1, argument2, argument10, 1, 0, argument11, argument12);
    draw_sprite_ext(argument3, argument14, argument1 + argument4, argument2 + argument5, argument10, 1, 0, argument11, argument12);
}

//if(global.shaders_compiled && os_type != os_android){
//    pal_swap_set(oControl.MultitroidPalette, ID, false);
//}
if (argument13 == 1) {
    draw_sprite_ext(argument6, argument14, argument1 + argument7, argument2 + argument8, argument10, 1, argument9, argument11, argument12);
}
shader_reset();

if(global.shaders_compiled && os_type != os_android){
    pal_swap_reset();
}
