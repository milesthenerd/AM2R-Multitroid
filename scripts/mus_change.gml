/// mus_change(sound)
if (oMusicV2.currentbgm != argument0) {
    oMusicV2.previousbgm = oMusicV2.currentbgm;
    oMusicV2.currentbgm = argument0;
    /*
    if(oMusicV2.playingSAX && !global.spectator){
        if(oMusicV2.sameRoomSAX){
            show_debug_message("how same???");
            if (audio_is_playing(oMusicV2.previousbgm)) audio_sound_gain(oMusicV2.previousbgm, 0, 0);
            if (audio_is_playing(oMusicV2.currentbgm)) audio_sound_gain(oMusicV2.currentbgm, 0, 0);
            if (audio_is_playing(musSAXEnvironmentalAmbience)) audio_sound_gain(musSAXEnvironmentalAmbience, 0, 2000);
            if (!audio_is_playing(musSAXAppear)) audio_play_sound(musSAXAppear, 1, true);
            audio_sound_gain(musSAXAppear, 0, 0);
            audio_sound_gain(musSAXAppear, global.opmusicvolume / 100, 0);
        } else {
            show_debug_message("how not same???");
            if (audio_is_playing(oMusicV2.previousbgm)) audio_sound_gain(oMusicV2.previousbgm, 0, 0);
            if (audio_is_playing(oMusicV2.currentbgm)) audio_sound_gain(oMusicV2.currentbgm, 0, 0);
            if (audio_is_playing(musSAXAppear)) audio_sound_gain(musSAXAppear, 0, 2000);
            if (!audio_is_playing(musSAXEnvironmentalAmbience)) audio_play_sound(musSAXEnvironmentalAmbience, 1, true);
            audio_sound_gain(musSAXEnvironmentalAmbience, 0, 0);
            audio_sound_gain(musSAXEnvironmentalAmbience, global.opmusicvolume / 100, 2000);
        }
        exit;
    }
    */
    if (audio_is_playing(oMusicV2.previousbgm)) audio_sound_gain(oMusicV2.previousbgm, 0, 3000);
    if (!audio_is_playing(oMusicV2.currentbgm)) audio_play_sound(oMusicV2.currentbgm, 1, true);
    audio_sound_gain(oMusicV2.currentbgm, 0, 0);
    audio_sound_gain(oMusicV2.currentbgm, global.opmusicvolume / 100, 3000);
    if (file_exists("musItemAmb2.ogg")) {
        if(oMusicV2.previousbgm == musItemAmb2) mus_resume(oMusicV2.currentbgm);
    }
}
