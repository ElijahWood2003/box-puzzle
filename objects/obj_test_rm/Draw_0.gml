/// @description  Drawing Objects + Border
    

// Taking the 2D Array and using the obj_map to draw each sprite according to its name
for(var yy = 0; yy < ds_grid_height(array2d); yy += 1){
    for(var xx = 0; xx < ds_grid_width(array2d); xx += 1){
        var obj_name = ds_list_find_value(ds_grid_get(array2d, xx, yy), 2);
        var ext = 1;
        if(obj_name == "obj_draw"){
            ext = .25;
        }
        if(obj_name != ""){
            draw_sprite_ext(ds_map_find_value(obj_map, obj_name), 0, ds_list_find_value(ds_grid_get(array2d, xx, yy), 0), ds_list_find_value(ds_grid_get(array2d, xx, yy), 1), ext, ext, 0, c_white, 1);
        }
    }
}
       
borderx = ds_list_find_value(ds_grid_get(array2d, 0, 0), 0)
bordery = ds_list_find_value(ds_grid_get(array2d, 0, 0), 1)
draw_rectangle_colour(borderx , bordery, ds_list_find_value(ds_grid_get(array2d, ds_grid_width(array2d) - 1, 0), 0) + 14 , ds_list_find_value(ds_grid_get(array2d, 0, ds_grid_height(array2d) - 1), 1) + 14, c_white, c_white, c_white, c_white, true);
        



/*
// Taking the 2D Array and using the obj_map to draw each sprite according to its name
for(var yy = 0; yy < ds_list_size(array2d); yy += 1){
    for(var xx = 0; xx < ds_list_size(ds_list_find_value(array2d, 0)); xx += 1){
        var obj_name = ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, yy), xx), 2);
        var ext = 1;
        if(obj_name == "obj_draw"){
            ext = .25;
        }
        if(obj_name != ""){
            draw_sprite_ext(ds_map_find_value(obj_map, obj_name), 0, ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, yy), xx), 0), ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, yy), xx), 1), ext, ext, 0, c_white, 1);
        }
    }
}
       
borderx = ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, 0), 0), 0)
bordery = ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, 0), 0), 1)
draw_rectangle_colour(borderx , bordery, ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, ds_list_size(ds_list_find_value(array2d, 0)) - 1), 0), 0) + 14 , ds_list_find_value(ds_list_find_value(ds_list_find_value(array2d, 0), ds_list_size(array2d) - 1), 1) + 14, c_white, c_white, c_white, c_white, true);
    

/* */
/// Testing
var list1;
var list2;
var list3;
var list4;
if(keyboard_check_pressed(ord("M"))){
    draw_test_map = scr_get_solutions();
    draw_map = true;
    list1 = ds_map_find_first(draw_test_map);
    list2 = list1[| 2];
    //list3 = list2[| 0];
    //list4 = list3[| 0];
}

if(draw_map){
    draw_text(0, 0, string_hash_to_newline(list1[| 2]));
}

/* */
/*  */
