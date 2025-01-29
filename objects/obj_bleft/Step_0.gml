/// @description  Movement/Creation

if(global.move_making){
    scr_bmove(id);
}
    
if(obj_draw.alarm[0] < 0 && !ds_list_empty(obj_draw.rev_listx) && keyboard_check_pressed(ord("E"))){
    scr_bmove_rev(id);
}

if(keyboard_check_pressed(ord("R")) && obj_draw.alarm[0] < 0){
    scr_bmove_restart(id);
}


