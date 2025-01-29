/// @description  Drawing Self
if(obj_persistent.grid){
    draw_sprite_ext(spr_wall, 1, x, y, 15/16, 15/16, 0, c_white, 1);
}
else {
    draw_sprite(spr_wall, 1, x, y);
}

