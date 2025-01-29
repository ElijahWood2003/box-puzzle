/// @description  scr_push_rev(instance id)
/// @param instance id
function scr_push_rev(argument0) {
	inst = argument0;
	if(abs(ds_list_find_value(inst.move_list, ds_list_size(inst.move_list) - 1)) > 1){
	    inst.x -= ds_list_find_value(inst.move_list, ds_list_size(inst.move_list) - 1)*1.6
	}
	else {
	    inst.y -= ds_list_find_value(inst.move_list, ds_list_size(inst.move_list) - 1)*16
	}
	ds_list_delete(inst.move_list, ds_list_size(inst.move_list) - 1);



}
