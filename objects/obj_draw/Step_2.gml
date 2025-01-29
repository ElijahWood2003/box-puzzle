/// @description  Reversing

if(alarm[0] < 0 && !ds_list_empty(rev_listx) && keyboard_check_pressed(ord("E"))){
    scr_set_rev();
    ds_list_delete(ds_map_find_value(global.test_map, room_get_name(room)), ds_list_size(ds_map_find_value(global.test_map, room_get_name(room))) - 1);
    //moves += 1;
}



/// Adding A Frame
if(global.move_making){
    ds_list_add(ds_map_find_value(global.test_map, room_get_name(room)), scr_return_frame());
}

global.move_making = false;

