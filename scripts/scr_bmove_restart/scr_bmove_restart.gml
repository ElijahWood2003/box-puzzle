/// @description  scr_bmove_restart(instance id)
/// @param instance id
function scr_bmove_restart(argument0) {
	inst = argument0;

	with(inst){
	    y = starty;
	    x = startx;
	    dirx = startdirx;
	    diry = startdiry;
	    instance_create(x, y, obj_bmove);
	    ds_list_clear(rot_list);
	}



}
