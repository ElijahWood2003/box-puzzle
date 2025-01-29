/// @description  Switching
if(global.move_making){
    ox = obj_draw.originx;
    oy = obj_draw.originy;
    if!((fill && y - oy >= 0 && (y - oy)/16 < array_height_2d(obj_draw.box_color) && x - ox >= 0 && (x - ox)/16 < array_length_2d(obj_draw.box_color, 0)
        && obj_draw.box_color[(y - oy)/16, (x - ox)/16] = 1) || place_meeting(x, y, obj_bmove) || place_meeting(x, y, obj_push)){
            fill = -sign(fill) + 1;
            
    }
    if(fill){
        instance_activate_object(inst);
    }
    else{
        instance_deactivate_object(inst);
    }
}



