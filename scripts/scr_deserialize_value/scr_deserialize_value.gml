/// @description scr_deserialize_value(value, ds, pds)
/// @param value
/// @param  ds
/// @param  pds
function scr_deserialize_value(argument0, argument1, argument2) {
	var value = argument0;
	var ds = argument1;
	var pds = argument2;


	/*
	    1) Check if it's any of the data structures
	    2) Check if it's an array or matrix
	    3) Check if the value is a primitive (string, int, etc)
	        Note: This must be done after any ID checks.
	    4) Raise error on any other data type
	*/

	if (ds = ds_type_list && pds = ds_type_map) {  
	    var list = ds_list_create();
	    for (var i = 0; i < ds_list_size(value); ++i) {    
	        ds_list_add(list, scr_deserialize_value(value[| i], ds_type_grid, ds_type_list));
	    }
	    return list;

	} else if (ds = ds_type_grid) {
	    var grid = ds_grid_create(ds_list_size(value[| 0]), ds_list_size(value));
	    for (var row = 0; row < ds_grid_height(grid); ++row) {
	        var list = value[| row];
	        for (var col = 0; col < ds_grid_width(grid); ++col) {
	            grid[# col, row] = list[| col];
	        }
	    }
	    return grid;
    
	} else if (ds = ds_type_map) {
	    var iterator = ds_map_find_first(value);
	    var map = ds_map_create();
	    while (!is_undefined(iterator)) {
	        map[? iterator] = scr_deserialize_value(value[? iterator], ds_type_list, ds_type_map);
	        iterator = ds_map_find_next(value, iterator);
	    }
	    return map;
    
	} else if (
	    scr_ds_exists(value, ds_type_stack)
	    || scr_ds_exists(value, ds_type_queue)
	    || scr_ds_exists(value, ds_type_priority)) {
	    show_error("Haven't implemented serializing of stacks/queues/priorities", true);
	} else if (is_array(value)) {
	    show_error("Haven't implemented serializing of arrays", true);
	} else if (is_matrix(value)) {
	    show_error("Haven't implemented serializing of matrices", true);
	} else if (
	    is_string(value)
	    || is_real(value)
	    || is_int32(value)
	    || is_int64(value)
	    || is_bool(value)) {
	    return value;
	} else {
	    // Could be is_ptr or is_undefined, can add more logging if this happens.
	    show_error("Unsupported value type", true);
	}



}
