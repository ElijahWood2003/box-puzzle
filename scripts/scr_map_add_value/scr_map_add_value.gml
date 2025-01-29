/// @description scr_map_add_value(map, key, value)
/// @param map
/// @param  key
/// @param  value
function scr_map_add_value(argument0, argument1, argument2) {
	var map = argument0;
	var key = argument1;
	var value = argument2;

	if (scr_ds_exists(value, ds_type_list)) {
	    ds_map_add_list(map, key, value);
	} else if (scr_ds_exists(value, ds_type_map)) {
	    ds_map_add_map(map, key, value);
	}

	// Otherwise do nothing.



}
