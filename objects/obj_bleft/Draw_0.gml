/// @description  Drawing Self
if(dirx = 0 && diry = -1){
    draw_sprite_ext(spr_bup, 0, x, y, (16 - obj_persistent.grid)/16, (16 - obj_persistent.grid)/16, 0, c_white, 1);
}
else if(dirx = 0 && diry = 1){
    draw_sprite_ext(spr_bdown, 0, x, y, (16 - obj_persistent.grid)/16, (16 - obj_persistent.grid)/16, 0, c_white, 1);
}
else if(dirx = -1 && diry = 0){
    draw_sprite_ext(spr_bleft, 0, x, y, (16 - obj_persistent.grid)/16, (16 - obj_persistent.grid)/16, 0, c_white, 1);
}
else {
    draw_sprite_ext(spr_bright, 0, x, y, (16 - obj_persistent.grid)/16, (16 - obj_persistent.grid)/16, 0, c_white, 1);
}

