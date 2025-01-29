/// @description  scr_add_rev()
function scr_add_rev() {
	var tempx = ds_list_create();
	var tempy = ds_list_create();
	var temporiginx = obj_draw.originx;
	var temporiginy = obj_draw.originy;
	var tempbox;
	for(var i = 0; i < ds_list_size(obj_draw.box_listx); i += 1){
	    ds_list_add(tempx, ds_list_find_value(obj_draw.box_listx, i));
	    ds_list_add(tempy, ds_list_find_value(obj_draw.box_listy, i));
	}

	for(var r = 0; r < array_height_2d(obj_draw.box_color); r += 1){
	    for(var c = 0; c < array_length_2d(obj_draw.box_color, 0); c += 1){
	        tempbox[r, c] = box_color[r, c];
	    }
	}

	ds_list_add(obj_draw.rev_listx, tempx);
	ds_list_add(obj_draw.rev_listy, tempy);
	ds_list_add(obj_draw.rev_listbox, tempbox);
	ds_list_add(obj_draw.rev_originx, temporiginx);
	ds_list_add(obj_draw.rev_originy, temporiginy);



}
