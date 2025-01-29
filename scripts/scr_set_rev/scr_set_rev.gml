/// @description  scr_set_rev()
function scr_set_rev() {
	obj_draw.box_listx = ds_list_find_value(obj_draw.rev_listx, ds_list_size(obj_draw.rev_listx) - 1);
	obj_draw.box_listy = ds_list_find_value(obj_draw.rev_listy, ds_list_size(obj_draw.rev_listy) - 1);
	obj_draw.originx = ds_list_find_value(obj_draw.rev_originx, ds_list_size(obj_draw.rev_originx) - 1);
	obj_draw.originy = ds_list_find_value(obj_draw.rev_originy, ds_list_size(obj_draw.rev_originy) - 1);
	obj_draw.box_color = ds_list_find_value(obj_draw.rev_listbox, ds_list_size(obj_draw.rev_listbox) - 1);

	ds_list_delete(obj_draw.rev_listx, ds_list_size(obj_draw.rev_listx) - 1);
	ds_list_delete(obj_draw.rev_listy, ds_list_size(obj_draw.rev_listy) - 1);
	ds_list_delete(obj_draw.rev_listbox, ds_list_size(obj_draw.rev_listbox) - 1);
	ds_list_delete(obj_draw.rev_originx, ds_list_size(obj_draw.rev_originx) - 1);
	ds_list_delete(obj_draw.rev_originy, ds_list_size(obj_draw.rev_originy) - 1);





}
