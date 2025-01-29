/// @description  scr_cleanup
function scr_cleanup() {

	for(var e = 0; e < array_height_2d(obj_draw.box_color)*array_length_2d(obj_draw.box_color, 0); e += 1){
	// Fixing box_color 1's
	while(scr_box_color_cleanup1() != -1){            
	    col = scr_box_color_cleanup1() mod array_length_2d(obj_draw.box_color, 0);
	    row = (scr_box_color_cleanup1() - col) / array_length_2d(obj_draw.box_color, 0);
	    obj_draw.box_color[row, col] = 0; 
	}
  
	for(var ix = 0; ix < ds_list_size(obj_draw.box_listx); ix += 1){
	    // Fixing random strands
	    if((ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 2) && ds_list_find_value(obj_draw.box_listy, ix) == ds_list_find_value(obj_draw.box_listy, ix + 2)) 
	        || (ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 1) && ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 2))
	        || (ds_list_find_value(obj_draw.box_listy, ix) == ds_list_find_value(obj_draw.box_listy, ix + 1) && ds_list_find_value(obj_draw.box_listy, ix) == ds_list_find_value(obj_draw.box_listy, ix + 2))){
	        ds_list_delete(obj_draw.box_listx, ix + 1);
	        ds_list_delete(obj_draw.box_listy, ix + 1);
	        ix = 0;
	    }

	    // Fixing repeat cases
	    if(ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 1) && ds_list_find_value(obj_draw.box_listy, ix) == ds_list_find_value(obj_draw.box_listy, ix + 1)){
	        ds_list_delete(obj_draw.box_listx, ix);
	        ds_list_delete(obj_draw.box_listy, ix);
	        ix = 0;
	    }
    
	    // Fixing Closed Boxes
	    /*
	    if(ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 1)){
	        for(var i = ix + 1; i < ds_list_size(obj_draw.box_listx); i += 1){
	            if(ds_list_find_value(obj_draw.box_listx, i) == ds_list_find_value(obj_draw.box_listx, i + 1) && ds_list_find_value(obj_draw.box_listx, i) == ds_list_find_value(obj_draw.box_listx, ix)
	               && ((ds_list_find_value(obj_draw.box_listy, i) > ds_list_find_value(obj_draw.box_listy, ix) && ds_list_find_value(obj_draw.box_listy, i) < ds_list_find_value(obj_draw.box_listy, ix + 1)
	               && ds_list_find_value(obj_draw.box_listy, i + 1) > ds_list_find_value(obj_draw.box_listy, ix) && ds_list_find_value(obj_draw.box_listy, i + 1) < ds_list_find_value(obj_draw.box_listy, ix + 1))
	               || (ds_list_find_value(obj_draw.box_listy, ix) <= ds_list_find_value(obj_draw.box_listy, i) && ds_list_find_value(obj_draw.box_listy, ix) >= ds_list_find_value(obj_draw.box_listy, i + 1)
	               && ds_list_find_value(obj_draw.box_listy, ix + 1) <= ds_list_find_value(obj_draw.box_listy, i) && ds_list_find_value(obj_draw.box_listy, ix + 1) >= ds_list_find_value(obj_draw.box_listy, i + 1))
	               || (ds_list_find_value(obj_draw.box_listy, ix) >= ds_list_find_value(obj_draw.box_listy, i) && ds_list_find_value(obj_draw.box_listy, ix) <= ds_list_find_value(obj_draw.box_listy, i + 1)
	               && ds_list_find_value(obj_draw.box_listy, ix + 1) >= ds_list_find_value(obj_draw.box_listy, i) && ds_list_find_value(obj_draw.box_listy, ix + 1) <= ds_list_find_value(obj_draw.box_listy, i + 1))
	               || (ds_list_find_value(obj_draw.box_listy, i) <= ds_list_find_value(obj_draw.box_listy, ix) && ds_list_find_value(obj_draw.box_listy, i) >= ds_list_find_value(obj_draw.box_listy, ix + 1)
	               && ds_list_find_value(obj_draw.box_listy, i + 1) <= ds_list_find_value(obj_draw.box_listy, ix) && ds_list_find_value(obj_draw.box_listy, i + 1) >= ds_list_find_value(obj_draw.box_listy, ix + 1))
	               || (ds_list_find_value(obj_draw.box_listy, i) >= ds_list_find_value(obj_draw.box_listy, ix) && ds_list_find_value(obj_draw.box_listy, i) <= ds_list_find_value(obj_draw.box_listy, ix + 1)
	               && ds_list_find_value(obj_draw.box_listy, i + 1) >= ds_list_find_value(obj_draw.box_listy, ix) && ds_list_find_value(obj_draw.box_listy, i + 1) <= ds_list_find_value(obj_draw.box_listy, ix + 1)))){
	                for(del = ix + 1; del < i; del += 1){
	                    ds_list_delete(obj_draw.box_listx, del);
	                    ds_list_delete(obj_draw.box_listy, del);
	                    del -= 1;
	                    i -= 1;
	                }
	            }
	        }
	    }
	    if(ds_list_find_value(obj_draw.box_listy, ix) == ds_list_find_value(obj_draw.box_listy, ix + 1)){
	        for(var i = ix + 1; i < ds_list_size(obj_draw.box_listy); i += 1){
	            if(ds_list_find_value(obj_draw.box_listy, i) == ds_list_find_value(obj_draw.box_listy, i + 1) && ds_list_find_value(obj_draw.box_listy, i) == ds_list_find_value(obj_draw.box_listy, ix)
	               && ((ds_list_find_value(obj_draw.box_listx, i) > ds_list_find_value(obj_draw.box_listx, ix) && ds_list_find_value(obj_draw.box_listx, i) < ds_list_find_value(obj_draw.box_listx, ix + 1)
	               && ds_list_find_value(obj_draw.box_listx, i + 1) > ds_list_find_value(obj_draw.box_listx, ix) && ds_list_find_value(obj_draw.box_listx, i + 1) < ds_list_find_value(obj_draw.box_listx, ix + 1))
	               || (ds_list_find_value(obj_draw.box_listx, ix) <= ds_list_find_value(obj_draw.box_listx, i) && ds_list_find_value(obj_draw.box_listx, ix) >= ds_list_find_value(obj_draw.box_listx, i + 1)
	               && ds_list_find_value(obj_draw.box_listx, ix + 1) <= ds_list_find_value(obj_draw.box_listx, i) && ds_list_find_value(obj_draw.box_listx, ix + 1) >= ds_list_find_value(obj_draw.box_listx, i + 1))
	               || (ds_list_find_value(obj_draw.box_listx, ix) >= ds_list_find_value(obj_draw.box_listx, i) && ds_list_find_value(obj_draw.box_listx, ix) <= ds_list_find_value(obj_draw.box_listx, i + 1)
	               && ds_list_find_value(obj_draw.box_listx, ix + 1) >= ds_list_find_value(obj_draw.box_listx, i) && ds_list_find_value(obj_draw.box_listx, ix + 1) <= ds_list_find_value(obj_draw.box_listx, i + 1))
	               || (ds_list_find_value(obj_draw.box_listx, i) <= ds_list_find_value(obj_draw.box_listx, ix) && ds_list_find_value(obj_draw.box_listx, i) >= ds_list_find_value(obj_draw.box_listx, ix + 1)
	               && ds_list_find_value(obj_draw.box_listx, i + 1) <= ds_list_find_value(obj_draw.box_listx, ix) && ds_list_find_value(obj_draw.box_listx, i + 1) >= ds_list_find_value(obj_draw.box_listx, ix + 1))
	               || (ds_list_find_value(obj_draw.box_listx, i) >= ds_list_find_value(obj_draw.box_listx, ix) && ds_list_find_value(obj_draw.box_listx, i) <= ds_list_find_value(obj_draw.box_listx, ix + 1)
	               && ds_list_find_value(obj_draw.box_listx, i + 1) >= ds_list_find_value(obj_draw.box_listx, ix) && ds_list_find_value(obj_draw.box_listx, i + 1) <= ds_list_find_value(obj_draw.box_listx, ix + 1)))){
	                for(del = ix + 1; del < i; del += 1){
	                    ds_list_delete(obj_draw.box_listx, del);
	                    ds_list_delete(obj_draw.box_listy, del);
	                    del -= 1;
	                    i -= 1;
	                }
	            }
	        }
	    }*/
	    if(ds_list_find_value(obj_draw.box_listx, ix) == ds_list_find_value(obj_draw.box_listx, ix + 1)){
	        for(var i = ix + 1; i < ds_list_size(obj_draw.box_listx); i += 1){
	            if(ds_list_find_value(obj_draw.box_listx, i) == ds_list_find_value(obj_draw.box_listx, i + 1) && ds_list_find_value(obj_draw.box_listx, i) == ds_list_find_value(obj_draw.box_listx, ix)){
	                scr_ini_comparison_cleanup(ds_list_find_value(obj_draw.box_listy, ix), ds_list_find_value(obj_draw.box_listy, ix + 1), ds_list_find_value(obj_draw.box_listy, i), ds_list_find_value(obj_draw.box_listy, i + 1), ix, i);
	            }
	        }   
	    }
    
	    if(ds_list_find_value(obj_draw.box_listy, ix) == ds_list_find_value(obj_draw.box_listy, ix + 1)){
	        for(var i = ix + 1; i < ds_list_size(obj_draw.box_listy); i += 1){
	            if(ds_list_find_value(obj_draw.box_listy, i) == ds_list_find_value(obj_draw.box_listy, i + 1) && ds_list_find_value(obj_draw.box_listy, i) == ds_list_find_value(obj_draw.box_listy, ix)){
	                scr_ini_comparison_cleanup(ds_list_find_value(obj_draw.box_listx, ix), ds_list_find_value(obj_draw.box_listx, ix + 1), ds_list_find_value(obj_draw.box_listx, i), ds_list_find_value(obj_draw.box_listx, i + 1), ix, i);
                
	            }
	        }   
	    }
	}

	}



}
