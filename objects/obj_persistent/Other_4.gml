/// @description  Background

__background_set_colour( c_black )
__background_set_showcolour( true );



/// Initializing Testing Map

    ds_map_add_list(global.test_map, room_get_name(room), scr_list_create());
    ds_list_add(ds_map_find_value(global.test_map, room_get_name(room)), scr_return_frame());


