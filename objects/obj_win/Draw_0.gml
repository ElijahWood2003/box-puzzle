/// @description  Drawing self

if(obj_persistent.grid){
    draw_sprite_ext(spr_win, 0, x, y, 15/16, 15/16, 0, c_white, 1);
}
else {
    draw_self();
}

