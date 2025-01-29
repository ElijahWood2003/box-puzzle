/// @description scr_list_create()
function scr_list_create() {
	var list = ds_list_create();

	//var map = scr_get_types_map();
	var key = scr_get_ds_key(list, ds_type_list);
	global.types_map[? key] = true;

	return list;



}
