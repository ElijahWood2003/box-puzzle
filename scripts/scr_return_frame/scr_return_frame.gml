/// @description  scr_return_frame()
function scr_return_frame() {
	// Returns a 2D array of information in the room 

	var bordery = obj_border.y;
	var borderx = obj_border.x;
	var borderwidth = obj_border.image_xscale*sprite_get_width(spr_border);
	var borderheight = obj_border.image_yscale*sprite_get_height(spr_border);
	var grid = scr_grid_create(borderwidth / 16, borderheight / 16);

	// Temporarily removing obj_border and obj_win to have proper collisions
	instance_deactivate_object(obj_border);
	instance_deactivate_object(obj_win);
	instance_deactivate_object(obj_bmove);

	var obj;
	var obj_name;

	// Going through each 16x16 square inside the border
	for(var yy = bordery; yy < borderheight + bordery; yy += 16){
	    for(var xx = borderx; xx < borderwidth + borderx; xx += 16){
	        gridx = (xx - borderx) / 16
	        gridy = (yy - bordery) / 16
	        // to make it easier, yy represents the exact y being checked, xx represents the exact x being checked
	        // creating a list with this information to store
	        grid[# gridx, gridy] = scr_list_create();
	        obj = collision_line(xx + 1, yy + 1, xx + 14, yy + 14, all, false, true); 
	        if(obj > 0){
	        obj_name = object_get_name(obj.object_index);
	        }
	        var ox = obj_draw.originx;
	        var oy = obj_draw.originy;
        
        
	        if(obj > 0 && object_get_name(obj.object_index) != "obj_draw"){
	            // Adding a list with x, y, and object name to the cell of the grid if the object is there
	            ds_list_add(grid[# gridx, gridy], xx, yy, object_get_name(obj.object_index));
	        }
	        else if(yy - oy >= 0 && (yy - oy)/16 < array_height_2d(obj_draw.box_color) && xx - ox >= 0 && (xx - ox)/16 < array_length_2d(obj_draw.box_color, 0)
	            && obj_draw.box_color[(yy - oy)/16, (xx - ox)/16] = 1){
	            // Checking if the for loops are within the bounds of the obj_draw shape and if so checking if the xy coord corresponds to a filled in square of the obj_draw
	            ds_list_add(grid[# gridx, gridy], xx, yy, "obj_draw");
	        }
	        else {
	            // If there is no object there it has no text for the name
	            ds_list_add(grid[# gridx, gridy], xx, yy, "");
	        }

        
	        // adding this list to the grid
	        //ds_grid_add(grid, gridx, gridy, grid[# gridx, gridy]);

	    }
	}
	instance_activate_object(obj_border);
	instance_activate_object(obj_win);
	instance_activate_object(obj_bmove);
	return grid;
                



}
