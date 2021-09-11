/// draw_character(sprite, x, y, sprite2, s2ox, s2oy, sprite3, s3ox, s3oy, s3angle, facing, color, alpha, s3show)

if(!oControl.useselfpalette){
    if(global.shaders_compiled && !oControl.msr_fusionsuit){
        if (oControl.mod_fusion) { // Fusion suit
            if (global.currentsuit == 0) { // Power
                pal_swap_set(sPalFusion0, 1, false);
            } else if (global.currentsuit == 1) { // Varia
                pal_swap_set(sPalFusion1, 1, false);
            } else if (global.currentsuit == 2) { // Gravity
                pal_swap_set(sPalFusion2, 1, false);
            }
        } else { // Custom color swaps
            if (global.currentsuit == 0 && os_type != os_android && oControl.PowerPalette != -1) { // Power
                pal_swap_set(oControl.PowerPalette, 1, false);
            } else if (global.currentsuit == 1 && os_type != os_android && oControl.VariaPalette != -1) { // Varia
                pal_swap_set(oControl.VariaPalette, 1, false);
            } else if (global.currentsuit == 2 && os_type != os_android && oControl.GravityPalette != -1) { // Gravity
                pal_swap_set(oControl.GravityPalette, 1, false);
            }
        }
    }
} else {
    if(global.shaders_compiled && instance_exists(oClient) && oClient.connected){
        if(oControl.mod_fusion){
            pal_swap_set(oControl.MultitroidPaletteFusion, global.clientID, 0);
        } else {
            pal_swap_set(oControl.MultitroidPalette, global.clientID, 0);
        }
    }
}


if(global.mosaic || global.reform){
    draw_sprite_pixelated(oCharacter.sprite_index, oCharacter.image_index, argument1, argument2, argument10, 1, image_angle, c_white, 1, oCharacter.sizeX, oCharacter.sizeY, 64);
    exit;
}

if(global.playerFreeze > 0){
    if(oControl.mod_fusion){
        if(argument10 == -1) oCharacter.sprite_index = sStandLeftFrozen_fusion;
        if(argument10 == 1) oCharacter.sprite_index = sStandRightFrozen_fusion;
        if(argument10 == -1 && oCharacter.state == oCharacter.DUCKING) oCharacter.sprite_index = sCrouchLeftFrozen_fusion;
        if(argument10 == 1 && oCharacter.state == oCharacter.DUCKING) oCharacter.sprite_index = sCrouchRightFrozen_fusion;
        if(oCharacter.state == oCharacter.BALL || oCharacter.state == oCharacter.AIRBALL || oCharacter.state == oCharacter.SPIDERBALL) oCharacter.sprite_index = sMorphBallFrozen_fusion;
        oCharacter.aspr1 = sNothingFrozen;
        oCharacter.aspr2 = sNothingFrozen;
    } else {
        if(global.currentsuit == 0){
            if(argument10 == -1) oCharacter.sprite_index = sStandLeftFrozen;
            if(argument10 == 1) oCharacter.sprite_index = sStandRightFrozen;
            if(argument10 == -1 && oCharacter.state == oCharacter.DUCKING) oCharacter.sprite_index = sCrouchLeftFrozen;
            if(argument10 == 1 && oCharacter.state == oCharacter.DUCKING) oCharacter.sprite_index = sCrouchRightFrozen;
            if(oCharacter.state == oCharacter.BALL || oCharacter.state == oCharacter.AIRBALL || oCharacter.state == oCharacter.SPIDERBALL) oCharacter.sprite_index = sMorphBallFrozen;
            oCharacter.aspr1 = sNothingFrozen;
            oCharacter.aspr2 = sNothingFrozen;
        } else {
            if(argument10 == -1) oCharacter.sprite_index = sVGStandLeftFrozen;
            if(argument10 == 1) oCharacter.sprite_index = sVGStandRightFrozen;
            if(argument10 == -1 && oCharacter.state == oCharacter.DUCKING) oCharacter.sprite_index = sVGCrouchLeftFrozen;
            if(argument10 == 1 && oCharacter.state == oCharacter.DUCKING) oCharacter.sprite_index = sVGCrouchRightFrozen;
            if(oCharacter.state == oCharacter.BALL || oCharacter.state == oCharacter.AIRBALL || oCharacter.state == oCharacter.SPIDERBALL) oCharacter.sprite_index = sVGMorphBallFrozen;
            oCharacter.aspr1 = sNothingFrozen;
            oCharacter.aspr2 = sNothingFrozen;
        }
    }
    draw_sprite_ext(oCharacter.sprite_index, argument14, argument1, argument2, argument10, 1, 0, argument11, argument12);
    if(global.playerFreeze > 0 && global.playerFreeze <= 36){
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(oCharacter.sprite_index, argument14, argument1, argument2, argument10, 1, 0, argument11, 1 - global.fxtimer * 0.25);
        draw_set_blend_mode(bm_normal);
    }
} else {
    if(global.beingAbsorbed){
        draw_sprite_ext(argument0, argument14, argument1, argument2, oCharacter.image_xscale, oCharacter.image_yscale, 0, argument11, argument12);
        draw_sprite_ext(argument3, argument14, argument1 + argument4, argument2 + argument5, oCharacter.image_xscale, oCharacter.image_yscale, 0, argument11, argument12);
    } else {
        draw_sprite_ext(argument0, argument14, argument1, argument2, argument10, 1, 0, argument11, argument12);
        draw_sprite_ext(argument3, argument14, argument1 + argument4, argument2 + argument5, argument10, 1, 0, argument11, argument12);
        if (argument13 == 1) {
            draw_sprite_ext(argument6, argument14, argument1 + argument7, argument2 + argument8, argument10, 1, argument9, argument11, argument12);
        }
    }
}

if(instance_exists(oClient) && instance_exists(oCharacter) && !global.mosaic && !global.reform){
    if(oClient.connected && string_lower(oClient.name) == "omegadruid" && string_count("JumpLeft", sprite_get_name(sprite_index)) == 0 && string_count("JumpRight", sprite_get_name(sprite_index)) == 0 && string_count("Ball", sprite_get_name(sprite_index)) == 0 && string_count("Walljump", sprite_get_name(sprite_index)) == 0 && string_count("Spacejump", sprite_get_name(sprite_index)) == 0){
        var sprHeight = sprite_get_height(sIdleRight);
        if(sprite_index != sTurn && sprite_index != sVTurn && sprite_index != sGTurn && sprite_index != sTurn_fusion && sprite_index != sTurn_fusion_varia && sprite_index != sTurn_fusion_gravity) sprHeight = sprite_height;
        if(string_count("AimUp", sprite_get_name(sprite_index)) > 0) sprHeight = sprite_get_height(sIdleRight);
        draw_sprite_ext(sMOmega_Head_Roar, 2, argument1, argument2 - sprHeight, 0.5 * argument10, 0.5, direction, c_white, 1);
    }
    
    if(oClient.connected && string_lower(oClient.name) == "meep" && string_count("JumpLeft", sprite_get_name(sprite_index)) == 0 && string_count("JumpRight", sprite_get_name(sprite_index)) == 0 && string_count("Ball", sprite_get_name(sprite_index)) == 0 && string_count("Walljump", sprite_get_name(sprite_index)) == 0 && string_count("Spacejump", sprite_get_name(sprite_index)) == 0){
        var sprHeight = sprite_get_height(sIdleRight);
        if(sprite_index != sTurn && sprite_index != sVTurn && sprite_index != sGTurn && sprite_index != sTurn_fusion && sprite_index != sTurn_fusion_varia && sprite_index != sTurn_fusion_gravity) sprHeight = sprite_height;
        if(string_count("AimUp", sprite_get_name(sprite_index)) > 0) sprHeight = sprite_get_height(sIdleRight);
        if(string_count("Crouch", sprite_get_name(sprite_index))) sprHeight += 10;
        draw_sprite_ext(sMiepee, 2, argument1, argument2 - sprHeight, 1 * argument10, 1, direction, c_white, 1);
    }
}

if(instance_exists(oClient) && instance_exists(oCharacter) && !global.mosaic && !global.reform){
    if(oClient.connected && string_lower(oClient.name) == "omegadruid" && string_count("JumpLeft", sprite_get_name(sprite_index)) == 0 && string_count("JumpRight", sprite_get_name(sprite_index)) == 0 && string_count("Ball", sprite_get_name(sprite_index)) == 0 && string_count("Walljump", sprite_get_name(sprite_index)) == 0 && string_count("Spacejump", sprite_get_name(sprite_index)) == 0){
        var sprHeight = sprite_get_height(sIdleRight);
        if(sprite_index != sTurn && sprite_index != sVTurn && sprite_index != sGTurn && sprite_index != sTurn_fusion && sprite_index != sTurn_fusion_varia && sprite_index != sTurn_fusion_gravity) sprHeight = sprite_height;
        if(string_count("AimUp", sprite_get_name(sprite_index)) > 0) sprHeight = sprite_get_height(sIdleRight);
        draw_sprite_ext(sMOmega_Head_Roar, 2, argument1, argument2 - sprHeight, 0.5 * argument10, 0.5, direction, c_white, 1);
    }
    
    if(oClient.connected && string_lower(oClient.name) == "meep" && string_count("JumpLeft", sprite_get_name(sprite_index)) == 0 && string_count("JumpRight", sprite_get_name(sprite_index)) == 0 && string_count("Ball", sprite_get_name(sprite_index)) == 0 && string_count("Walljump", sprite_get_name(sprite_index)) == 0 && string_count("Spacejump", sprite_get_name(sprite_index)) == 0){
        var sprHeight = sprite_get_height(sIdleRight);
        if(sprite_index != sTurn && sprite_index != sVTurn && sprite_index != sGTurn && sprite_index != sTurn_fusion && sprite_index != sTurn_fusion_varia && sprite_index != sTurn_fusion_gravity) sprHeight = sprite_height;
        if(string_count("AimUp", sprite_get_name(sprite_index)) > 0) sprHeight = sprite_get_height(sIdleRight);
        if(string_count("Crouch", sprite_get_name(sprite_index))) sprHeight += 10;
        draw_sprite_ext(sMiepee, 2, argument1, argument2 - sprHeight, 1 * argument10, 1, direction, c_white, 1);
    }
}

shader_reset();
