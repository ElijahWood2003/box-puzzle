/// @description  Initializing



grid = false;
global.move_making = false;


obj_map = ds_map_create();
    ds_map_add(obj_map, "obj_draw", spr_draw);
    ds_map_add(obj_map, "obj_block", spr_block);
    ds_map_add(obj_map, "obj_wall", spr_wall);
    ds_map_add(obj_map, "obj_push", spr_push);
    ds_map_add(obj_map, "obj_bup", spr_bup);
    ds_map_add(obj_map, "obj_bdown", spr_bdown);
    ds_map_add(obj_map, "obj_bleft", spr_bleft);
    ds_map_add(obj_map, "obj_bright", spr_bright);
    ds_map_add(obj_map, "obj_bpush", spr_bpush);


// Centering objects in room creation
var shiftx = (room_width - obj_border.image_xscale*sprite_get_width(spr_border) - obj_border.x * 2) / 2;
var shifty = (room_height - obj_border.image_yscale*sprite_get_height(spr_border) - obj_border.y * 2) / 2;
var inst_list = ds_list_create();
ds_list_add(inst_list, obj_draw, obj_border, obj_block, obj_bparent, obj_win, obj_push, obj_switch);                  // Every new object should be added in this list
for(var i = 0; i < ds_list_size(inst_list); i += 1){
    with(ds_list_find_value(inst_list, i)){
        x += shiftx;
        y += shifty;
        startx = x;
        starty = y;
	}
}


// Removing the list
ds_list_destroy(inst_list);
with(obj_push){
    startx = x;
    starty = y;
}

