/// @description scr_ds_exists(ds, type)
/// @param ds
/// @param  type
function scr_ds_exists(argument0, argument1) {

	var key = string(argument0) + ":" + string(argument1);
	var result = ds_map_exists(global.types_map, key);

	return result



}
