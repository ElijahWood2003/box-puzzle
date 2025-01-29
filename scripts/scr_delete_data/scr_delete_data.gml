/// @description scr_delete_data(value)
/// @param value
function scr_delete_data(argument0) {
	var value = argument0;

	/*
	    1) Check if the value is a primitive (string, int, etc)
	    2) Check if it's any of the data structures
	    3) Check if it's an array or matrix
	    4) Raise error on any other data type
	*/
	if (
	    is_string(value)
	    || is_real(value)
	    || is_int32(value)
	    || is_int64(value)
	    || is_bool(value)) {
	    // Pass
	} else if (scr_ds_exists(value, ds_type_list)) {
	    for (var i = 0; i < ds_list_size(value); ++i) {
	        scr_delete_data(value[| i]);
	    }
	    ds_list_destroy(value);
	} else if (scr_ds_exists(value, ds_type_grid)) {
	    for (var row = 0; row < ds_grid_height(value); ++row) {
	        for (var col = 0; col < ds_grid_width(value); ++col) {
	            scr_delete_data(value[# col, row]);
	        }
	    }
	    ds_grid_destroy(value);
	} else if (scr_ds_exists(value, ds_type_map)) {
	    var iterator = ds_map_find_first(value);
	    while (!is_undefined(iterator)) {
	        scr_delete_data(value[? iterator]);
	        iterator = ds_map_find_next(value, iterator);
	    }
	    ds_map_destroy(value);
	} else if (
	    scr_ds_exists(value, ds_type_stack)
	    || scr_ds_exists(value, ds_type_queue)
	    || scr_ds_exists(value, ds_type_priority)) {
	    show_error("Haven't implemented serializing of stacks/queues/priorities", true);
	} else if (is_array(value)) {
	    show_error("Haven't implemented serializing of arrays", true);
	} else if (is_matrix(value)) {
	    show_error("Haven't implemented serializing of matrices", true);
	} else {
	    // Could be is_ptr or is_undefined, can add more logging if this happens.
	    show_error("Unsupported value type", true);
	}



}
