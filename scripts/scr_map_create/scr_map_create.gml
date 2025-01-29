/// @description scr_map_create()
function scr_map_create() {
	var result = ds_map_create();

	//var map = scr_get_types_map();
	var key = scr_get_ds_key(result, ds_type_map);
	global.types_map[? key] = true;

	return result;



}
