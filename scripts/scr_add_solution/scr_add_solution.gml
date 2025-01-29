/// @description  scr_add_solution() - opens json test file and adds the current test_map to it
function scr_add_solution() {

	var file_name = working_directory + "/test.txt";

	if(file_exists(file_name)){
	    file_delete(file_name)
	}

	/*
	// Converting the ds_grid into ds_lists inside a ds_list for json file
	var temp_map = global.test_map;
	var room_s = ds_map_find_first(global.test_map);
	var size = ds_map_size(global.test_map);
	for(var m = 0; m < size; m += 1){                                   // Iterating through map
	    list = ds_map_find_value(global.test_map, room_s);
	    ds_list_clear(ds_map_find_value(temp_map, room_s));
	    for(var l = 0; l < ds_list_size(list); l += 1){                 // Iterating through the list
	        grid = ds_list_find_value(list, l);
	        ds_list_add(ds_map_find_value(temp_map, room_s), ds_list_create());
	        for(var r = 0; r < ds_grid_height(grid); r += 1){           // Iterating through rows of grid
	            ds_list_add(ds_list_find_value
	            for(var c = 0; c < ds_grid_width(grid); c += 1){        // Iterating through columns of grid
	                ds_list_add(ds_list_find_value(ds_map_find_value(temp_map, room_s), l)
	            */

	// Recursively serialize the data to primitives, ds_list, and ds_map
	var temp_data = scr_serialize_value(global.test_map, ds_type_map, -1);

	var file = file_text_open_write(file_name);
	file_text_write_string(file, json_encode(temp_data));
	file_text_close(file);

	// Delete data recursively after serializing it.
	//scr_delete_data(temp_data);



}
