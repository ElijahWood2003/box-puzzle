/// @description  scr_check_push(dirx, diry, instance) - returns number of push objects in a row if the vertices should push obj_push
/// @param dirx
/// @param  diry
/// @param  instance
function scr_check_push(argument0, argument1, argument2) {
	var dx = argument0;             // Either equals -1, 0, 1
	var dy = argument1;             // Either equals -1, 0, 1
	var inst = argument2;           // Instance of obj_push checked

	var i = 0;
	var coll_push = 0;
	var centx = inst.x;
	var centy = inst.y;
	while(collision_point(centx + dx*16*i, centy + dy*16*i, obj_border, false, true) && !collision_rectangle(centx + dx*16*i + 1, centy + dy*16*i + 1, centx + dx*16*i + 15, centy + dy*16*i + 15, obj_block, false, true)){
	    var incx = dx*16*i;
	    var incy = dy*16*i;
	    obj_draw.drawbsx = centx + incx;
	    obj_draw.drawbsy = centy + incy;
	    if!(collision_rectangle(centx + incx + 1, centy + incy + 1, centx + incx + 15, centy + dy*16*i + 15, obj_push, false, true) || collision_rectangle(centx + dx*16*i + 1, centy + dy*16*i + 1, centx + dx*16*i + 15, centy + dy*16*i + 15, obj_block, false, true)){
	        return coll_push;
	    } else if(collision_rectangle(centx + dx*16*i + 1, centy + dy*16*i + 1, centx + dx*16*i + 15, centy + dy*16*i + 15, obj_push, false, true)){
	        coll_push += 1;                                     
	    } 
    
	    i += 1;
	}
	return 0;



	//sign(obj_border.x + sign(dir + 1)*obj_border.image_xscale*sprite_get_width(spr_border) - centx) != dir)



}
