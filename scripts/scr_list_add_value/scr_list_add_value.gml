/// @description scr_list_add_value(list, index, value)
/// @param list
/// @param  index
/// @param  value
function scr_list_add_value(argument0, argument1, argument2) {
	var list = argument0;
	var index = argument1;
	var value = argument2;

	// Always insert the value.
	list[| index] = value;
    
	if (scr_ds_exists(value, ds_type_list)) {
	    ds_list_mark_as_list(list, index);
	} else if (scr_ds_exists(value, ds_type_map)) {
	    ds_list_mark_as_map(list, index);
	}



}
