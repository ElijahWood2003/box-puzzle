/// @description  Changing Room/Frame

// Moving the frame forward
if(keyboard_check_pressed(ord("E")) && index != ds_list_size(list) - 1){
    index += 1;
    array2d = ds_list_find_value(list, index);   
}

// Moving the frame backwards
if(keyboard_check_pressed(ord("W")) && index != 0){
    index -= 1;
    array2d = ds_list_find_value(list, index);   
}

// Moving the room backwards and reseting index/list
if(keyboard_check_pressed(ord("S")) && room_num != 1){
    room_num -= 1;
    scr_change_test_room(); 
}

// Moving the room forwards and reseting index/list
if(keyboard_check_pressed(ord("D")) && room_num != ds_map_size(global.test_map)){
    room_num += 1;
    scr_change_test_room();     
}

// Retrieving test.txt
if(keyboard_check_pressed(ord("U"))){   
    global.test_map = scr_get_solutions();
}

