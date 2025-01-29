/// @description  scr_check_wall()
function scr_check_wall() {
	for(var r = 0; r < array_height_2d(obj_draw.box_color); r += 1){
	    for(var c = 0; c < array_length_2d(obj_draw.box_color, 0); c += 1){
	        var checkx = obj_draw.originx + c*16;
	        var checky = obj_draw.originy + r*16;
	        if(obj_draw.box_color[r, c] = 1 and collision_line(checkx, checky, checkx + 15, checky, obj_block, false, true)){
	            return true;
	        }
	    }
	}
	return false;



}
