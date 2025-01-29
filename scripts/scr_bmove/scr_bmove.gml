/// @description  scr_bmove(instance id)
/// @param instance id
function scr_bmove(argument0) {
	var inst = argument0;

	var bpush = collision_point(inst.x + inst.dirx*16, inst.y + inst.diry*16, obj_bpush, false, true);
	if(bpush && scr_check_push(inst.dirx, inst.diry, bpush) != 0){
	    var coll_push = scr_check_push(inst.dirx, inst.diry, bpush);
	    var curr_inst = bpush;
	    var next_inst = collision_point(bpush.x + inst.dirx*16, bpush.y + inst.diry*16, obj_bpush, false, true);
	    for(var c = 0; c < coll_push; c += 1){
	        if!(curr_inst = noone){
	            scr_push_add_move(curr_inst, inst.dirx, inst.diry);
	            curr_inst.x += 16*inst.dirx;
	            curr_inst.y += 16*inst.diry;
	            curr_inst = next_inst;
	            next_inst = collision_point(bpush.x + inst.dirx*16*(c + 1), bpush.y + inst.diry*16*(c + 1), obj_bpush, false, true);
	            }
	        else {
	            break;
	        }    
	    }
	}
    
	if(place_meeting(inst.x + inst.dirx*16, inst.y + inst.diry*16, obj_border) && !place_meeting(inst.x + inst.dirx*16, inst.y + inst.diry*16, obj_block) && !place_meeting(inst.x + inst.dirx*16, inst.y + inst.diry*16, obj_push)){
	    inst.y += inst.diry*16;
	    inst.x += inst.dirx*16;
	    instance_create(inst.x, inst.y, obj_bmove);
	    scr_list_movey(inst.diry);
	    scr_list_movex(-inst.dirx);
	}
	else {
	    var tempy = inst.diry;
	    inst.diry = inst.dirx;
	    inst.dirx = -tempy;
	    ds_list_add(inst.rot_list, inst.x*abs(dirx) + inst.y*abs(diry));
	}
    



}
