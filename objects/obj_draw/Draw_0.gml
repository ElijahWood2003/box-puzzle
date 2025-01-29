/// @description  Drawing Box

// Drawing inner box
var inner_col = c_fuchsia;
var win_col = c_silver;
var grid_col = c_white;

if(!keyboard_check(vk_space) && alarm[0] < 0){
    for(r = 0; r < array_height_2d(box_color); r += 1){
        for(c = 0; c < array_length_2d(box_color, 0); c += 1){
            if(box_color[r, c] = 1){
                draw_rectangle_colour(originx + 16*c, originy + 16*r, originx + 16*c + 15, originy + 16*r + 15, inner_col, inner_col, inner_col, inner_col, false);
            }
        }
    }
    
    // Drawing priority square
    var life_col = c_maroon;
    var startx = ds_list_find_value(box_listx, 0);
    var starty = ds_list_find_value(box_listy, 0);
    draw_rectangle_colour(startx, starty, startx + (15 * l_num) - 1, starty + (15 * h_num) - 1, life_col, life_col, life_col, life_col, false);
}
else if(alarm[0] > 0){
    for(r = 0; r < array_height_2d(box_color); r += 1){
        for(c = 0; c < array_length_2d(box_color, 0); c += 1){
            if(box_color[r, c] = 1){
                draw_rectangle_colour(originx + 16*c, originy + 16*r, originx + 16*c + 15, originy + 16*r + 15, win_col, win_col, win_col, win_col, false);
            }
        }
    }
}

// Drawing outline
var col_vert = c_white;
draw_primitive_begin(pr_linestrip);
draw_set_colour(col_vert);
for(var i = 0; i < ds_list_size(box_listx); i += 1){
    draw_vertex(ds_list_find_value(box_listx, i), ds_list_find_value(box_listy, i));
}

draw_primitive_end();

// Drawing grid
if(obj_persistent.grid){
    for(r = 0; r < array_height_2d(box_color); r += 1){
        for(c = 0; c < array_length_2d(box_color, 0); c += 1){
            if(box_color[r, c] = 1){
                draw_rectangle_colour(originx + 16*c, originy + 16*r, originx + 16*c + 14, originy + 16*r + 14, grid_col, grid_col, grid_col, grid_col, true);
            }
        }
    }
}



//  DEBUG

//draw_rectangle_colour(drawbsx, drawbsy, drawbsx + 15, drawbsy + 15, c_white, c_white, c_white, c_white, false);



/*
for(var i = 0; i < ds_list_size(box_listy); i += 1){
    draw_text(i*48 + 100, y - 64, ds_list_find_value(box_listx, i));
    draw_text(i*48 + 100, y - 48, ds_list_find_value(box_listy, i));
}
/*
for(var r = 0; r < height / 16; r += 1){
    for(var c = 0; c < length / 16; c += 1){
        draw_text(originx + c * 16, originy + r * 16, box_color[r, c]);
    }
}


/* */
/// Drawing Text
var xscale = 10;
var yscale = 1;
var col = c_white;
//var str = "Moves: " + string(moves);

draw_set_font(fnt_moves);
//draw_text_colour(room_width / 2 - xscale * string_length(str), obj_border.y / 2, str, col, col, col, col, 1);

// Drawing help text
var help_text = "Press 'E' or 'R'";
var text_height_change = 7;
var sin_speed = 0.5;
if(ds_list_size(box_listx) <= 1/* || (moves == 0 && scr_check_level_end() == 0)*/){
    for(var i = 1; i <= string_length(help_text); i += 1){
        draw_text_colour((room_width / 2 - 8.5 * string_length(help_text)) + i*16, (obj_border.y / 2) + 48 + (sin(sin_text + i*0.1)*text_height_change), string_hash_to_newline(string_char_at(help_text, i)), col, col, col, col, 1);
    }
    sin_text += 0.1 * sin_speed;
}

/* */
/// Menu
var bord_color = c_white;
var inner_color = c_dkgray;
var inner_color_on = c_silver;

    // Grid toggle
var base_y = 160;
draw_roundrect_colour(menu_base_x, base_y, menu_base_x + but_width, base_y + but_height, bord_color, bord_color, true);
if!(obj_persistent.grid){
    draw_roundrect_colour(menu_base_x, base_y, menu_base_x + but_width, base_y + but_height, inner_color, inner_color, false);
}
else {
    draw_roundrect_colour(menu_base_x, base_y, menu_base_x + but_width, base_y + but_height, inner_color_on, inner_color_on, false);
}
draw_set_font(fnt_options);
draw_text(menu_base_x + 4, base_y + 4, string_hash_to_newline("Grid Toggle"));


/* */
/*  */
