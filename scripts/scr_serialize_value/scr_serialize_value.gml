/// @description scr_serialize_value(value, ds, pds)
/// @param value
/// @param  ds
/// @param  pds
function scr_serialize_value(argument0, argument1, argument2) {
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


	if (ds = ds_type_list) {
	    var final = ds_list_size(value) == 3 && is_string(ds_list_find_value(value, 2));
	    if(final){
	        return value;
	    }
	    var list = ds_list_create();
	    for (var i = 0; i < ds_list_size(value); ++i) {
	        if(pds = ds_type_map){
	            ds_list_insert(list, i, scr_serialize_value(value[| i], ds_type_grid, ds_type_list));
	            ds_list_mark_as_list(list, i);
	        }
	        //else if(final){
	            //ds_list_insert(list, i, ds_list_find_value(value, i));
	           // ds_list_mark_as_list(list, i);
	        //}
	        else {
	            ds_list_insert(list, i, scr_serialize_value(value[| i], ds_type_list, ds_type_list));
	            ds_list_mark_as_list(list, i);
	        }
	    }
    
	    // Serialize as a special map so we know this is a list and not a grid
	    // when we have to deserialize it.
	    //var map = scr_map_create();
	    //scr_map_add_value(map, "___list___", list);
	    return list;
	} else if (ds = ds_type_grid) {
	    var list1 = ds_list_create();
	    for (var row = 0; row < ds_grid_height(value); ++row) {
	        var list2 = ds_list_create();
	        for (var col = 0; col < ds_grid_width(value); ++col) {
	            ds_list_insert(list2, col, scr_serialize_value(value[# col, row], ds_type_list, ds_type_list));
	            ds_list_mark_as_list(list2, col);
	        }
	        ds_list_insert(list1, row, list2);
	        ds_list_mark_as_list(list1, row);
	    }
    
	    // Serialize as a special map so we know this is a grid and not a list
	    // when we have to deserialize it.
	    //var map = scr_map_create();
	    //scr_map_add_value(map, "___grid___", list1);
	    return list1;
	} else if (ds = ds_type_map) {
	    var map = ds_map_create();
	    var iterator = ds_map_find_first(value);
	    while (!is_undefined(iterator)) {
	        show_debug_message("Key: " + iterator);
	        ds_map_add_list(map, iterator, scr_serialize_value(value[? iterator], ds_type_list, ds_type_map));
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
