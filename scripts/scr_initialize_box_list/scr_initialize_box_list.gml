/// @description  scr_initialize_box_list()
function scr_initialize_box_list() {
	ds_list_clear(box_listx);
	ds_list_clear(box_listy);

	ds_list_add(box_listx, x);
	ds_list_add(box_listy, y);

	ds_list_add(box_listx, length + x);
	ds_list_add(box_listy, y);

	ds_list_add(box_listx, length + x);
	ds_list_add(box_listy, height + y);

	ds_list_add(box_listx, x);
	ds_list_add(box_listy, height + y);

	ds_list_add(box_listx, x);
	ds_list_add(box_listy, y);



}
