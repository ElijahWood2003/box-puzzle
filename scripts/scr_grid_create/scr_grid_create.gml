/// @description scr_grid_create(width, height)
/// @param width
/// @param  height
function scr_grid_create(argument0, argument1) {
	var grid = ds_grid_create(argument0, argument1);

	// var map = scr_get_types_map();
	var key = scr_get_ds_key(grid, ds_type_grid);
	global.types_map[? key] = true;

	return grid;



}
