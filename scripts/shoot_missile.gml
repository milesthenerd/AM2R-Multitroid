/// shoot_missile(direction)
var missileX = 0;
var missileY = 0;
if (global.currentweapon == 1 && global.missiles > 0 || global.currentweapon == 2 && global.smissiles > 0) {
    msl = instance_create(x + aspr2x, y + aspr2y, oMissile);
    msl.direction = argument0;
    msl.speed = 6.4;
    msl.image_angle = argument0;
    sfx_play(sndFireMissile);
    with (msl) beam_offset(4, direction);
    if (argument0 == 180) {
        msl.x += 4;
        if (state != GRIP) msl.y -= 1;
    }
    if (argument0 == 0) msl.x -= 4;
    if (argument0 == 90) {
        msl.y += 4;
        if (facing == LEFT) msl.x += 1;
    }
    missileX = msl.x;
    missileY = msl.y;
    msl.smissile = global.currentweapon == 2;
    if (global.currentweapon == 1) {
        global.missiles -= 1;
        msl.sprite_index = sMissile;
        msl.alarm[0] = 1;
        msl.damage = 20;
        nofire = 10;
    }
    if (global.currentweapon == 2) {
        global.smissiles -= 1;
        msl.sprite_index = sSMissile;
        msl.alarm[0] = 1;
        msl.damage = 100;
        PlaySoundMono(sndFlyby);
        nofire = 20;
    }
    if (global.icemissiles && global.currentweapon == 1){
        msl.sprite_index = sIceMissile;
    }
    with (msl) {
        trail = instance_create(x, y, oMissileTrail);
        trail.direction = direction;
        trail.smissile = smissile;
        trail.fadein_speed = 0.04;
        if (global.currentweapon == 2) {
            trail.sprite_index = sSMissileTrail1;
            trail.fadein_speed = 0.1;
        }
        /*
        if(global.icemissiles && global.currentweapon == 1){
            trail.sprite_index = sIceMissileTrail;
        }
        */
    }
} // if (global.currentweapon == 1 && global.missiles > 0 || global.currentweapon == 2 && global.smissiles > 0)
if (global.currentweapon == 2 && global.smissiles == 0) global.currentweapon = 1;
if (global.currentweapon == 1 && global.missiles == 0) global.currentweapon = 0;

if(instance_exists(oClient) && missileX != 0 && missileY != 0){
    if(ds_list_size(oClient.roomListData) >= 0){
        var size, type, alignment;
        size = 1024;
        type = buffer_grow;
        alignment = 1;
        missileBuffer = buffer_create(size, type, alignment);
        buffer_seek(missileBuffer, buffer_seek_start, 0);
        buffer_write(missileBuffer, buffer_u8, 23);
        buffer_write(missileBuffer, buffer_u8, global.clientID);
        buffer_write(missileBuffer, buffer_u8, global.currentweapon);
        buffer_write(missileBuffer, buffer_s16, argument0);
        buffer_write(missileBuffer, buffer_s16, missileX);
        buffer_write(missileBuffer, buffer_s16, missileY);
        var bufferSize = buffer_tell(missileBuffer);
        buffer_seek(missileBuffer, buffer_seek_start, 0);
        buffer_write(missileBuffer, buffer_s32, bufferSize);
        buffer_write(missileBuffer, buffer_u8, 23);
        buffer_write(missileBuffer, buffer_u8, global.clientID);
        buffer_write(missileBuffer, buffer_u8, global.currentweapon);
        buffer_write(missileBuffer, buffer_s16, argument0);
        buffer_write(missileBuffer, buffer_s16, missileX);
        buffer_write(missileBuffer, buffer_s16, missileY);
        var result = network_send_packet(oClient.socket, missileBuffer, buffer_tell(missileBuffer));
        buffer_delete(missileBuffer);
    }
}
