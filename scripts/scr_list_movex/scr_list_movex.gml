/// @description  scr_list_movex(cdir)
/// @param cdir
function scr_list_movex(argument0) {
	var cdir = argument0;
	    // Checking for collisions and properly adding
	for(var ix = 0; ix < ds_list_size(obj_draw.box_listx); ix += 1){
	    if(ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 1)){            // checking if there is a spot in the x-list that are equal (vertical line)
       
	        var tempx = ds_list_find_value(obj_draw.box_listx, ix);                                                   // vertical x being used
	        var dir = sign(ds_list_find_value(obj_draw.box_listy, ix + 1) - ds_list_find_value(obj_draw.box_listy, ix)); // vertical direction being checked (finalx - initialx) either 1 or -1
        
	        if(dir = cdir){
	            for(var iy = ds_list_find_value(obj_draw.box_listy, ix); iy != ds_list_find_value(obj_draw.box_listy, ix + 1); iy += 16 * dir){
	                var p_inst = collision_line(tempx - sign(dir + 1)*16, iy + 1*dir, tempx - sign(dir + 1)*16, iy + 15*dir, obj_push, false, true);
	                if(collision_line(tempx - sign(dir + 1)*16, iy + 1*dir, tempx - sign(dir + 1)*16, iy + 15*dir, obj_block, false, true)
	                || (p_inst && scr_check_push(dir, 0, p_inst) == 0)){
	                    obj_draw.box_color[(iy - obj_draw.originy) / 16 + sign(dir - 1), (ds_list_find_value(obj_draw.box_listx, ix) - obj_draw.originx) / 16 - sign(dir + 1)] = 0;
	                    ds_list_insert(obj_draw.box_listy, ix + 1, iy);
	                    ds_list_insert(obj_draw.box_listy, ix + 2, iy);
	                    ds_list_insert(obj_draw.box_listy, ix + 3, iy + 16*dir);
	                    ds_list_insert(obj_draw.box_listy, ix + 4, iy + 16*dir);
                        
	                    ds_list_insert(obj_draw.box_listx, ix + 1, tempx);
	                    ds_list_insert(obj_draw.box_listx, ix + 2, tempx - 16*dir);
	                    ds_list_insert(obj_draw.box_listx, ix + 3, tempx - 16*dir);
	                    ds_list_insert(obj_draw.box_listx, ix + 4, tempx);
	                    ix += 4;
	                }
	                else if(p_inst){
	                    var coll_push = scr_check_push(dir, 0, p_inst);
	                    var curr_inst = p_inst;
	                    var next_inst = collision_point(p_inst.x + dir*16, p_inst.y, obj_push, false, true);
	                    for(var c = 0; c < coll_push; c += 1){
	                        if!(curr_inst = noone){
	                            scr_push_add_move(curr_inst, dir, 0);
	                            curr_inst.x += 16*dir;
	                            curr_inst = next_inst;
	                            next_inst = collision_point(p_inst.x + dir*16*(c + 1), p_inst.y, obj_push, false, true);
	                        }
	                        else {
	                            break;
	                        }    
	                    }
	                }
	            }   
	        }
	    }
	}
	scr_cleanup();
	obj_draw.alarm[0] = scr_check_level_end() * 101 - 1;      



}
