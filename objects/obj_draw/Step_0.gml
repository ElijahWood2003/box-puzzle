/// @description  Movement

if!(ds_list_size(box_listx) <= 1){
if(keyboard_check_pressed(vk_left) && scr_check_movex(-1)) {
    var minx = scr_check_minmax(-1, box_listx);
    if(minx > obj_border.x /*&& moves != 0*/){                                                                    // Checking the minimum x value
        scr_add_rev();
        global.move_making = true;
        
        // Moving each point in x to the left   
        for(var i = 0; i < ds_list_size(box_listx); i += 1){
            ds_list_replace(box_listx, i, ds_list_find_value(box_listx, i) - 16);
        } 
        originx -= 16;
        scr_list_movex(-1);
        //moves -= 1;
        move = true;

    }
}

if(keyboard_check_pressed(vk_right) && scr_check_movex(1)){
    var maxx = scr_check_minmax(1, box_listx);
    if(maxx < obj_border.image_xscale*sprite_get_width(spr_border) + obj_border.x/* && moves != 0*/){           // Checking max x value
        
        scr_add_rev();
        global.move_making = true;
        
        // Moving each point in x to the right   
        for(var i = 0; i < ds_list_size(box_listx); i += 1){
            ds_list_replace(box_listx, i, ds_list_find_value(box_listx, i) + 16);
        } 
        originx += 16;
        scr_list_movex(1);
        //moves -= 1;
        move = true;
    }
}

if(keyboard_check_pressed(vk_up) && scr_check_movey(1)){
    var miny = scr_check_minmax(-1, box_listy);
    if(miny > obj_border.y /*&& moves != 0*/){                                                                  // Checking mininum y value
        scr_add_rev();
        global.move_making = true;
        
        // Moving each point in y to the up   
        for(var i = 0; i < ds_list_size(box_listy); i += 1){
            ds_list_replace(box_listy, i, ds_list_find_value(box_listy, i) - 16);
        } 
        originy -= 16;
        scr_list_movey(1);
        //moves -= 1;
        move = true;
        
    } 
}

if(keyboard_check_pressed(vk_down) && scr_check_movey(-1)){
    var maxy = scr_check_minmax(1, box_listy);
    if(maxy < obj_border.image_yscale*sprite_get_height(spr_border) + obj_border.y /*&& moves != 0*/){          // Checking max y value
    
        scr_add_rev();
        global.move_making = true;
        
        // Moving each point in y to the down  
        for(var i = 0; i < ds_list_size(box_listy); i += 1){
            ds_list_replace(box_listy, i, ds_list_find_value(box_listy, i) + 16);
        } 
        originy += 16;
        scr_list_movey(-1);
        //moves -= 1;
        move = true;
    } 
}
}

/* */
/// Commands
// Rotating the priority square
if(keyboard_check_pressed(ord("Q")) && !move){
    scr_rotate_edges();
}

// Fullscreen
if(keyboard_check_pressed(vk_f10)){
    if(window_get_fullscreen()){   
        window_set_fullscreen(false);
    }
    else {
        window_set_fullscreen(true);
    }
}

// Waiting at a spot
if(keyboard_check_pressed(ord("W")) && alarm[0] < 0){
    scr_add_rev();
    global.move_making = true;
    alarm[1] = 45;
}
    // Holding 'W' to wait many times
if!(keyboard_check(ord("W"))){
    alarm[1] = -1;
    is_waiting = false;
}
else if(keyboard_check(ord("W")) && is_waiting && alarm[3] < 0 && alarm[0] < 0){
    alarm[3] = 6;
}


// Restarting
if(keyboard_check_pressed(ord("R")) && alarm[0] < 0){
    /// Initalizing
    move = false;
    //moves = ini_moves;

    originx = x;
    originy = y;

    // 2D arraylist for drawing inner color
    for(var r = 0; r < height / 16; r += 1){
        for(var c = 0; c < length / 16; c += 1){
            box_color[r, c] = 1;
        }
    }
    
    ds_list_clear(ds_map_find_value(global.test_map, room_get_name(room)));
    ds_list_add(ds_map_find_value(global.test_map, room_get_name(room)), scr_return_frame());
    
    scr_initialize_box_list();
    ds_list_clear(rev_listx);
    ds_list_clear(rev_listy);
    ds_list_clear(rev_listbox);
    var l_temp = l_num;
    var h_temp = h_num;
    l_num = 1;
    h_num = 1;
    while!(l_temp = l_num && h_temp = h_num){
        scr_rotate_edges();
    }
}

// Testing
if(keyboard_check_pressed(vk_f3)){
    room_goto(rm_test);
}

// Next room
if(keyboard_check_pressed(vk_f2)){
    room_goto_next();
}





/* */
/// Menu
if(mouse_check_button_pressed(mb_left) && mouse_x > menu_base_x && mouse_x < menu_base_x + but_width && mouse_y > 160 && mouse_y < 160 + but_height){
    if(obj_persistent.grid){
        obj_persistent.grid = false;
    }
    else {
        obj_persistent.grid = true;
    }
}

/* */
/*  */
