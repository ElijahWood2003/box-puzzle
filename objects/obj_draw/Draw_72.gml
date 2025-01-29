/// @description  Drawing Border

if(first){
    border = surface_create(room_width, room_height);
    surface_set_target(border);
    draw_rectangle_colour(obj_border.x, obj_border.y, obj_border.image_xscale*sprite_get_width(spr_border) + obj_border.x - 2, obj_border.image_yscale*sprite_get_height(spr_border) + obj_border.y - 2, c_white, c_white, c_white, c_white, true);
    surface_reset_target();
    first = false;
}
else {
    draw_surface(border, 0, 0);
}

