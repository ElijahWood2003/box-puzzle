/// @description  scr_check_level_end() - returns true if the player is properly on top of the obj_win blocks, false otherwise
function scr_check_level_end() {
	var num_block_win = instance_number(obj_win);      // Number of obj_win instances in the room to check for
	var num_top = 0;                                   // Number of player blocks that have been checked to be on top of an obj_win instance

	// Running through every 16x16 square in obj_draw checking if there is an obj_win instance beneath it
	for(var r = 0; r < array_height_2d(obj_draw.box_color); r += 1){
	    for(var c = 0; c < array_length_2d(obj_draw.box_color, 0); c += 1){
	        var checkx = obj_draw.originx + c*16;
	        var checky = obj_draw.originy + r*16;
	        if(obj_draw.box_color[r, c] = 1 and collision_line(checkx, checky, checkx + 15, checky, obj_win, false, true)){ 
	            num_top += 1;
	        }
	        else if(obj_draw.box_color[r, c] = 1){     // Returning false as soon as it finds a single 16x16 that does not have obj_win below it
	            return false;
	        }
	    }
	}

	// Returning true if the number of instances in the room of obj_win is equal to the number found to be underneath the player box, false otherwise
	return num_block_win == num_top;




}
