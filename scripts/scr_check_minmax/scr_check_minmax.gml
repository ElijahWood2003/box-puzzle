/// @description  scr_check_minmax(sign, list) - returns value of minx/miny or maxx/maxy
/// @param sign
/// @param  list
function scr_check_minmax(argument0, argument1) {
	var s = argument0;
	var list = argument1;
	var ret = ds_list_find_value(list, 0);
	for(var i = 1; i < ds_list_size(list); i += 1){                                           // Finding the farthest x coordinate to the left, actually unnecessary
	    if(sign(ds_list_find_value(list, i) - ret) == s){
	        ret = ds_list_find_value(list, i);
	    }
	}
	return ret;



}
