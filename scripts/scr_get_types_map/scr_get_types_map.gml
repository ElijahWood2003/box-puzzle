/// @description scr_get_types_map()
function scr_get_types_map() {
	if (is_undefined(global.types_map)) {
	    global.types_map = ds_map_create();
	}
	return global.types_map;



}
