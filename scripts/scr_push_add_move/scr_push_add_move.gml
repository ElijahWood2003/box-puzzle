/// @description  scr_push_add_move(instance id, dir x, dir y)
/// @param instance id
/// @param  dir x
/// @param  dir y
function scr_push_add_move(argument0, argument1, argument2) {
	inst = argument0;
	dx = argument1
	dy = argument2
	ds_list_add(inst.move_list, dx*10 + dy);



}
