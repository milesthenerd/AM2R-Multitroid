/// draw_character(sprite, x, y, sprite2, s2ox, s2oy, sprite3, s3ox, s3oy, s3angle, facing, color, alpha, s3show)

if(global.shaders_compiled){
    if ((oControl.mod_fusion) && (!oControl.msr_fusionsuit)) { // Fusion suit
        if (global.currentsuit == 0) { // Power
            pal_swap_set(sPalFusion0, 1, false);
        } else if (global.currentsuit == 1) { // Varia
            pal_swap_set(sPalFusion1, 1, false);
        } else if (global.currentsuit == 2) { // Gravity
            pal_swap_set(sPalFusion2, 1, false);
        }
    } else { // Custom color swaps
        if (global.currentsuit == 0 && os_type != os_android) { // Power
            pal_swap_set(oControl.PowerPalette, 1, false);
        } else if (global.currentsuit == 1 && os_type != os_android) { // Varia
            pal_swap_set(oControl.VariaPalette, 1, false);
        } else if (global.currentsuit == 2 && os_type != os_android) { // Gravity
            pal_swap_set(oControl.GravityPalette, 1, false);
        }
    }
}

draw_sprite_ext(argument0, argument14, argument1, argument2, argument10, 1, 0, argument11, argument12);
draw_sprite_ext(argument3, argument14, argument1 + argument4, argument2 + argument5, argument10, 1, 0, argument11, argument12);
if (argument13 == 1) {
    draw_sprite_ext(argument6, argument14, argument1 + argument7, argument2 + argument8, argument10, 1, argument9, argument11, argument12);
}

if(instance_exists(oClient) && instance_exists(oCharacter)){
    if(oClient.connected && string_lower(oClient.name) == "omegadruid" && oCharacter.state != oCharacter.BALL && oCharacter.state != oCharacter.CLIMBING && oCharacter.vjump != 0 && !(oCharacter.sjball > 0) && oCharacter.state != oCharacter.AIRBALL){
        var sprHeight = sprite_get_height(sIdleRight);
        if(sprite_index != sTurn && sprite_index != sVTurn && sprite_index != sGTurn && sprite_index != sTurn_fusion && sprite_index != sTurn_fusion_varia && sprite_index != sTurn_fusion_gravity) sprHeight = sprite_height;
        draw_sprite_ext(sMOmega_Head_Roar, 2, argument1, argument2 - sprHeight, 0.5 * argument10, 0.5, direction, c_white, 1);
    }
    
    if(oClient.connected && string_lower(oClient.name) == "meep" && oCharacter.state != oCharacter.BALL && oCharacter.state != oCharacter.CLIMBING && oCharacter.vjump != 0 && !(oCharacter.sjball > 0) && oCharacter.state != oCharacter.AIRBALL){
        var sprHeight = sprite_get_height(sIdleRight);
        if(sprite_index != sTurn && sprite_index != sVTurn && sprite_index != sGTurn && sprite_index != sTurn_fusion && sprite_index != sTurn_fusion_varia && sprite_index != sTurn_fusion_gravity) sprHeight = sprite_height;
        if(string_count("Crouch", sprite_get_name(sprite_index))) sprHeight += 10;
        draw_sprite_ext(sMiepee, 2, argument1, argument2 - sprHeight, 1 * argument10, 1, direction, c_white, 1);
    }
}

shader_reset();
