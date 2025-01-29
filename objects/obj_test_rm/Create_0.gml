/// @description  Initializing

obj_map = ds_map_create();
    ds_map_add(obj_map, "obj_draw", spr_draw);
    ds_map_add(obj_map, "obj_block", spr_block);
    ds_map_add(obj_map, "obj_wall", spr_wall);
    ds_map_add(obj_map, "obj_push", spr_push);
    ds_map_add(obj_map, "obj_bup", spr_bup);
    ds_map_add(obj_map, "obj_bdown", spr_bdown);
    ds_map_add(obj_map, "obj_bleft", spr_bleft);
    ds_map_add(obj_map, "obj_bright", spr_bright);
    ds_map_add(obj_map, "obj_bpush", spr_bpush);


room_num = real(string_digits(ds_map_find_first(global.test_map)));
index = 0;                                                                      //ds_list_size(ds_map_find_value(global.test_map, ds_map_find_first(global.test_map)));
list = ds_map_find_value(global.test_map, "rm" + string(room_num));             // List of frames (2d arrays) for a given room
length = ds_list_size(list);                                                            // Easy accessor for length of the list being used
array2d = ds_list_find_value(list, index);                                              // The specific frame of the room 

// Testing
draw_test_map = ds_map_create();
draw_map = false;

