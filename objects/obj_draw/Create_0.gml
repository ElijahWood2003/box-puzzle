/// @description  Initalizing

instance_create(0, 0, obj_persistent);

drawbsx = 0;
drawbsy = 0;

// Menu
but_height = 32;
but_width = 208;
menu_base_x = 48;
sin_text = 0;


// Drawing colored inside
length = obj_draw.image_xscale*sprite_get_width(spr_draw);
height = obj_draw.image_yscale*sprite_get_height(spr_draw);
originx = x;
originy = y;

move = false;
first = true;

// Drawing "life" square
l_num = 1;
h_num = 1;


// 2D arraylist for drawing inner color
box_color[0, 0] = 1;
for(var r = 0; r < height / 16; r += 1){
    for(var c = 0; c < length / 16; c += 1){
        box_color[r, c] = 1;
    }
}

// Essentially creating a 2D arraylist
box_listx = ds_list_create();
box_listy = ds_list_create();
scr_initialize_box_list();

// Reversing list initializing
rev_listx = ds_list_create();
rev_listy = ds_list_create();
rev_listbox = ds_list_create();
rev_originx = ds_list_create();
rev_originy = ds_list_create();

// Setting reverse and wait variables
is_waiting = false;
is_reversing = false;



