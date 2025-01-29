/// @description  scr_rotate_edges();
function scr_rotate_edges() {
	//var tempx = obj_draw.box_listx;
	//var tempy = obj_draw.box_listy;
	for(var i = 0; i < ds_list_size(obj_draw.box_listx) - 1; i += 1){
	    ds_list_replace(obj_draw.box_listx, i, ds_list_find_value(obj_draw.box_listx, i + 1));
	    ds_list_replace(obj_draw.box_listy, i, ds_list_find_value(obj_draw.box_listy, i + 1));
	}
	ds_list_replace(obj_draw.box_listx, ds_list_size(obj_draw.box_listx) - 1, ds_list_find_value(obj_draw.box_listx, 0));
	ds_list_replace(obj_draw.box_listy, ds_list_size(obj_draw.box_listy) - 1, ds_list_find_value(obj_draw.box_listy, 0));

	var startx = ds_list_find_value(box_listx, 0);
	var starty = ds_list_find_value(box_listy, 0);
	obj_draw.l_num = sign(originx - startx + 1);
	obj_draw.h_num = sign(originy - starty + 1);



}
