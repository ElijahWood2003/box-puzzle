/// @description  scr_get_solutions() - returns the decoded json file as a map
function scr_get_solutions() {
	var file_name = working_directory + "/test.txt";
	if(file_exists(file_name)){
	    var file = file_text_open_read(file_name);
	    var map = json_decode(file);
	    file_text_close(file);
    
	    // Deserialize, which will convert "grids" back to actual grids.
	    //var map = scr_deserialize_value(map, ds_type_map, -1);
    
	    return map;
	}
	return -1;




}
