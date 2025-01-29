/// @description  scr_flip(list)
/// @param list
function scr_flip() {

	var temp_listx = ds_list_create();
	var temp_listy = ds_list_create();
	for(var i = ds_list_size(obj_draw.box_listx) - 1; i >= 0; i -= 1){
	    ds_list_add(temp_listx, ds_list_find_value(obj_draw.box_listx, i));
	    ds_list_add(temp_listy, ds_list_find_value(obj_draw.box_listy, i));
	}

	obj_draw.box_listx = temp_listx;
	obj_draw.box_listy = temp_listy;



}
