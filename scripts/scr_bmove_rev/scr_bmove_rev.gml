/// @description  scr_bmove(instance id)
/// @param instance id
function scr_bmove_rev(argument0) {
	var inst = argument0;
	if(!(inst.dirx = 0 && inst.y = ds_list_find_value(inst.rot_list, ds_list_size(inst.rot_list) - 1)) 
	   && !(inst.diry = 0 && inst.x = ds_list_find_value(inst.rot_list, ds_list_size(inst.rot_list) - 1))){
	    inst.y -= diry*16;
	    inst.x -= dirx*16;
	    instance_create(inst.x, inst.y, obj_bmove);
	}
	else {
	    var tempx = inst.dirx;
	    inst.dirx = inst.diry;
	    inst.diry = -tempx;
	    ds_list_delete(inst.rot_list, ds_list_size(inst.rot_list) - 1);
	}



}
