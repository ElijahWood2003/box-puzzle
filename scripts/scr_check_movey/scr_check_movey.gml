/// @description  scr_check_movey(cdir)   - returns true if there are no obj_walls obstructing the path, false otherwise
/// @param cdir
function scr_check_movey(argument0) {

	if(obj_draw.alarm[0] > 0){
	    return false
	}

	var cdir = argument0;
	for(var iy = 0; iy < ds_list_size(obj_draw.box_listy); iy += 1){
	    if(ds_list_find_value(obj_draw.box_listy, iy) == ds_list_find_value(obj_draw.box_listy, iy + 1)){       // checking if there is a spot in the y-list that are equal (horizontal line)
        
	        var tempy = ds_list_find_value(obj_draw.box_listy, iy);                                             // vertical y being used
	        var dir = sign(ds_list_find_value(obj_draw.box_listx, iy + 1) - ds_list_find_value(obj_draw.box_listx, iy)); // horizontal direction being checked (finaly - initialy) either 1 or -1
        
	        if(dir == cdir){
	            for(var ix = ds_list_find_value(obj_draw.box_listx, iy); ix != ds_list_find_value(obj_draw.box_listx, iy + 1); ix += 16 * dir){
	                if(collision_line(ix + 1*dir, tempy + -dir*15, ix + 15*dir, tempy + -dir*15, obj_wall, false, true)){
	                    return false;             
	                }        
	            }
	        }
	    }
	}

	return true;



}
