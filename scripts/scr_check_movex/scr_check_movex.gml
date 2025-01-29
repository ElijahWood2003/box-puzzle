/// @description  scr_check_movex(cdir)   - returns true if there are no obj_walls obstructing the path, false otherwise
/// @param cdir
function scr_check_movex(argument0) {

	if(obj_draw.alarm[0] > 0){
	    return false
	}

	var cdir = argument0;
	    // Checking for collisions and properly adding
	for(var ix = 0; ix < ds_list_size(obj_draw.box_listx); ix += 1){
	    if(ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 1)){            // checking if there is a spot in the x-list that are equal (vertical line)
       
	        var tempx = ds_list_find_value(obj_draw.box_listx, ix);                                                   // vertical x being used
	        var dir = sign(ds_list_find_value(obj_draw.box_listy, ix + 1) - ds_list_find_value(obj_draw.box_listy, ix)); // vertical direction being checked (finalx - initialx) either 1 or -1
        
	        if(dir = cdir){
	            for(var iy = ds_list_find_value(obj_draw.box_listy, ix); iy != ds_list_find_value(obj_draw.box_listy, ix + 1); iy += 16 * dir){
	                if(collision_line(tempx + dir*15, iy + 1*dir, tempx + dir*15, iy + 15*dir, obj_wall, false, true)){
	                    return false;
	                }
	            }   
	        }
	    }
	}

	return true;




}
