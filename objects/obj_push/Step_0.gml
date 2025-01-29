/// @description  Commands
if(keyboard_check_pressed(ord("R")) && obj_draw.alarm[0] < 0){
    x = startx;
    y = starty;
    ds_list_clear(move_list);
}

if(obj_draw.alarm[0] < 0 && !ds_list_empty(obj_draw.rev_listx) && keyboard_check_pressed(ord("E"))){
    scr_push_rev(id);
}

is_made = global.move_making;

