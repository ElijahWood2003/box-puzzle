/// @description  DEBUG
/*
if!(room == rm_test){
var grid = ds_list_find_value(ds_map_find_value(global.test_map, room_get_name(room)), ds_list_size(ds_map_find_value(global.test_map, room_get_name(room))) - 1);
var shifty = 250;
//var length = ds_list_size(list);                                                           
//var array2d = ds_list_find_value(global.rm_list, index);  
draw_set_font(fnt_small);

//gridx = 9;
//gridy = 1;

//draw_text(x, y, ds_list_find_value(grid[# gridx, gridy], 0));
//draw_text(x, y + 15, ds_grid_width(grid));
//draw_text(x, y + 30, ds_grid_height(grid));


for(var yy = 0; yy < ds_grid_height(grid); yy += 1){
    for(var xx = 0; xx < ds_grid_width(grid); xx += 1){
        var ext = 1;
        if(ds_list_find_value(ds_grid_get(grid, xx, yy), 2) == "obj_draw"){
            ext = .25;
        }
        if(ds_list_find_value(ds_grid_get(grid, xx, yy), 2) != "")
            draw_sprite_ext(ds_map_find_value(obj_map, ds_list_find_value(ds_grid_get(grid, xx, yy), 2)), 0, ds_list_find_value(ds_grid_get(grid, xx, yy), 0), ds_list_find_value(ds_grid_get(grid, xx, yy), 1) + 250, ext, ext, 0, c_white, 1);
        
        //draw_text(ds_list_find_value(ds_grid_get(grid, xx, yy), 0), ds_list_find_value(ds_grid_get(grid, xx, yy), 1) + 250, ds_list_find_value(ds_grid_get(grid, xx, yy), 2));
       
        //draw_sprite(ds_map_find_value(obj_map, obj_name), 0, ds_list_find_value(ds_grid_get(array2d, xx, yy), 0), ds_list_find_value(ds_grid_get(array2d, xx, yy), 1));
    }
}
}





/*
if!(room == rm_test){
var grid = ds_list_find_value(ds_map_find_value(global.test_map, room_get_name(room)), ds_list_size(ds_map_find_value(global.test_map, room_get_name(room))) - 1);
var shifty = 250;
//var length = ds_list_size(list);                                                           
//var array2d = ds_list_find_value(global.rm_list, index);  
draw_set_font(fnt_small);

//gridx = 9;
//gridy = 1;

//draw_text(x, y, ds_list_find_value(grid[# gridx, gridy], 0));
//draw_text(x, y + 15, ds_grid_width(grid));
//draw_text(x, y + 30, ds_grid_height(grid));


for(var yy = 0; yy < ds_list_size(grid); yy += 1){
    for(var xx = 0; xx < ds_list_size(ds_list_find_value(grid, 0)); xx += 1){
        var ext = 1;
        if(ds_list_find_value(ds_list_find_value(ds_list_find_value(grid, xx), yy), 2) == "obj_draw"){
            ext = .25;
        }
        if(ds_list_find_value(ds_list_find_value(ds_list_find_value(grid, xx), yy), 2) != "")
            draw_sprite_ext(ds_map_find_value(obj_map, ds_list_find_value(ds_list_find_value(ds_list_find_value(grid, xx), yy), 2)), 0, ds_list_find_value(ds_list_find_value(ds_list_find_value(grid, xx), yy), 0), ds_list_find_value(ds_list_find_value(ds_list_find_value(grid, xx), yy), 1) + 250, ext, ext, 0, c_white, 1);
        
        //draw_text(ds_list_find_value(ds_grid_get(grid, xx, yy), 0), ds_list_find_value(ds_grid_get(grid, xx, yy), 1) + 250, ds_list_find_value(ds_grid_get(grid, xx, yy), 2));
       
        //draw_sprite(ds_map_find_value(obj_map, obj_name), 0, ds_list_find_value(ds_grid_get(array2d, xx, yy), 0), ds_list_find_value(ds_grid_get(array2d, xx, yy), 1));
    }
}
}

/* */
/*  */
