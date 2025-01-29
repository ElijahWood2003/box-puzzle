/// @description  Drawing Self

var col = c_orange;

if(keyboard_check(vk_space) && place_meeting(x, y, obj_win)){
    draw_rectangle_colour(x, y, x + 14, y + 14, col, col, col, col, true);
}
else if(obj_persistent.grid){
    draw_sprite_ext(spr_push, 0, x, y, 15/16, 15/16, 0, c_white, 1);
}
else {
    draw_self();
}

