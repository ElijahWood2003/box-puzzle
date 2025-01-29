/// @description  scr_box_color_cleanup1() - returns 2Darray position as 2d point multiple, else -1
function scr_box_color_cleanup1() {


	for(var r = 0; r < array_height_2d(obj_draw.box_color); r += 1){
	    for(var c = 0; c < array_length_2d(obj_draw.box_color, 0); c += 1){
	        if(obj_draw.box_color[r, c] = 1){
	            var inix = obj_draw.originx + c*16;   
	            var iniy = obj_draw.originy + r*16;
	            // Checking the four spots around the 1, if it is not surrounded by 1's or lines it will return integer multiple
	            if!(r > 0 && obj_draw.box_color[r - 1, c] = 1){                                                            // Top Line
	                for(var i = 0; i < ds_list_size(obj_draw.box_listx); i += 1){        
	                    if(ds_list_find_value(obj_draw.box_listx, i) <= inix && ds_list_find_value(obj_draw.box_listx, i + 1) >= (inix + 16)
	                       && ds_list_find_value(obj_draw.box_listy, i) = iniy && ds_list_find_value(obj_draw.box_listy, i + 1) = iniy) {
	                        break;
	                    }
	                    else if(i = ds_list_size(obj_draw.box_listx) - 1){
	                        return c + (r*array_length_2d(obj_draw.box_color, 0));
	                    }
	                }
	            }
	            if!(r < array_height_2d(obj_draw.box_color) - 1 && obj_draw.box_color[r + 1, c] = 1){                   // Bottom Line
	                for(var i = 0; i < ds_list_size(obj_draw.box_listx); i += 1){        
	                    if(ds_list_find_value(obj_draw.box_listx, i) >= inix + 16 && ds_list_find_value(obj_draw.box_listx, i + 1) <= inix
	                       && ds_list_find_value(obj_draw.box_listy, i) = iniy + 16 && ds_list_find_value(obj_draw.box_listy, i + 1) = iniy + 16) {
	                        break;
	                    }
	                    else if(i = ds_list_size(obj_draw.box_listx) - 1){
	                        return c + (r*array_length_2d(obj_draw.box_color, 0));
	                    }
	                }
	            }
	            if!(c > 0 && obj_draw.box_color[r, c - 1] = 1){                                                            // Left Line
	                for(var i = 0; i < ds_list_size(obj_draw.box_listy); i += 1){        
	                    if(ds_list_find_value(obj_draw.box_listy, i) >= iniy + 16 && ds_list_find_value(obj_draw.box_listy, i + 1) <= iniy
	                       && ds_list_find_value(obj_draw.box_listx, i) = inix && ds_list_find_value(obj_draw.box_listx, i + 1) = inix) {
	                        break;
	                    }
	                    else if(i = ds_list_size(obj_draw.box_listy) - 1){
	                        return c + (r*array_length_2d(obj_draw.box_color, 0));
	                    }
	                }
	            }
	            if!(c < array_length_2d(obj_draw.box_color, 0) - 1 && obj_draw.box_color[r, c + 1] = 1){                      // Right Line
	                for(var i = 0; i < ds_list_size(obj_draw.box_listy); i += 1){        
	                    if(ds_list_find_value(obj_draw.box_listy, i) <= iniy && ds_list_find_value(obj_draw.box_listy, i + 1) >= (iniy + 16)
	                       && ds_list_find_value(obj_draw.box_listx, i) = inix + 16 && ds_list_find_value(obj_draw.box_listx, i + 1) = inix + 16) {
	                        break;
	                    }
	                    else if(i = ds_list_size(obj_draw.box_listy) - 1){
	                        return c + (r*array_length_2d(obj_draw.box_color, 0));
	                    }
	                }
	            }
	        }        
	    }
	}
	return -1;



}
