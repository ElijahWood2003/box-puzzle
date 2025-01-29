/// @description  scr_list_movey(cdir)
/// @param cdir
function scr_list_movey(argument0) {

	var cdir = argument0;
	for(var iy = 0; iy < ds_list_size(obj_draw.box_listy); iy += 1){
	    if(ds_list_find_value(obj_draw.box_listy, iy) == ds_list_find_value(obj_draw.box_listy, iy + 1)){       // checking if there is a spot in the y-list that are equal (horizontal line)
        
	        var tempy = ds_list_find_value(obj_draw.box_listy, iy);                                             // vertical y being used
	        var dir = sign(ds_list_find_value(obj_draw.box_listx, iy + 1) - ds_list_find_value(obj_draw.box_listx, iy)); // horizontal direction being checked (finaly - initialy) either 1 or -1
        
	        if(dir == cdir){
	            for(var ix = ds_list_find_value(obj_draw.box_listx, iy); ix != ds_list_find_value(obj_draw.box_listx, iy + 1); ix += 16 * dir){
	                var p_inst = collision_line(ix + 1*dir, tempy + sign(dir - 1)*16, ix + 15*dir, tempy + sign(dir - 1)*16, obj_push, false, true);
	                if(collision_line(ix + 1*dir, tempy + sign(dir - 1)*16, ix + 15*dir, tempy + sign(dir - 1)*16, obj_block, false, true)
	                || (p_inst && !scr_check_push(0, -dir, p_inst) )){
	                    obj_draw.box_color[(ds_list_find_value(obj_draw.box_listy, iy) - obj_draw.originy) / 16 + sign(dir - 1), (ix - obj_draw.originx) / 16 + sign(dir - 1)] = 0;
	                    ds_list_insert(obj_draw.box_listx, iy + 1, ix);
	                    ds_list_insert(obj_draw.box_listx, iy + 2, ix);
	                    ds_list_insert(obj_draw.box_listx, iy + 3, ix + 16*dir);
	                    ds_list_insert(obj_draw.box_listx, iy + 4, ix + 16*dir);
                        
	                    ds_list_insert(obj_draw.box_listy, iy + 1, tempy);
	                    ds_list_insert(obj_draw.box_listy, iy + 2, tempy + 16*dir);
	                    ds_list_insert(obj_draw.box_listy, iy + 3, tempy + 16*dir);
	                    ds_list_insert(obj_draw.box_listy, iy + 4, tempy);
	                    iy += 4;                
	                }
	                else if(p_inst){
	                    var coll_push = scr_check_push(0, -dir, p_inst);
	                    var curr_inst = p_inst;
	                    var next_inst = collision_point(p_inst.x, p_inst.y - dir*16, obj_push, false, true);
	                    for(var c = 0; c < coll_push; c += 1){
	                        if!(curr_inst = noone){
	                            scr_push_add_move(curr_inst, 0, -dir);
	                            curr_inst.y -= 16*dir;
	                            curr_inst = next_inst;
	                            next_inst = collision_point(p_inst.x, p_inst.y - dir*16*(c + 1), obj_push, false, true);
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
