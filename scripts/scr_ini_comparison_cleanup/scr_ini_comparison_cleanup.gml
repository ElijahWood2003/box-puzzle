/// @description  scr_ini_comparison_cleanup(ini1, fin1, ini2, fin2, ix, i)
/// @param ini1
/// @param  fin1
/// @param  ini2
/// @param  fin2
/// @param  ix
/// @param  i
function scr_ini_comparison_cleanup() {
	var ini1 = argument[0];
	var fin1 = argument[1];
	var ini2 = argument[2];
	var fin2 = argument[3];
	var ix = argument[4];
	var i = argument[5];
	var sign1 = sign(fin1 - ini1);
	var sign2 = sign(fin2 - ini2);    
	if(sign1 * sign2 = 1){
	    for(var t = ini1 * sign1; t < fin1 * sign1; t += 16){
	        for(var s = ini2 * sign2; s < fin2 * sign2; s += 16){
	            if(t*sign1 == s*sign2){
	                for(del = ix + 1; del < i; del += 1){
	                    ds_list_delete(obj_draw.box_listx, del);
	                    ds_list_delete(obj_draw.box_listy, del);
	                    del -= 1;
	                    i -= 1;
	                }
	            }
	        }        
	    }
	}
	else {
	    for(var t = fin1 * sign1; t > ini1 * sign1; t -= 16){
	        for(var s = ini2 * sign2; s < fin2 * sign2; s += 16){
	            if(t*sign1 == s*sign2){
	                for(del = ix + 1; del < i; del += 1){
	                    ds_list_delete(obj_draw.box_listx, del);
	                    ds_list_delete(obj_draw.box_listy, del);
	                    del -= 1;
	                    i -= 1;
	                }
	            }
	        }        
	    }
	}
    
    



}
