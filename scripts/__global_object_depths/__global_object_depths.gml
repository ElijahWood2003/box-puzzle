function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_draw
	global.__objectDepths[1] = -1; // obj_block
	global.__objectDepths[2] = 0; // obj_border
	global.__objectDepths[3] = 1; // obj_win
	global.__objectDepths[4] = 0; // obj_push
	global.__objectDepths[5] = 0; // obj_bpush
	global.__objectDepths[6] = 0; // obj_switch
	global.__objectDepths[7] = 0; // obj_wall
	global.__objectDepths[8] = 0; // obj_persistent
	global.__objectDepths[9] = 0; // obj_test_rm
	global.__objectDepths[10] = 0; // obj_bparent
	global.__objectDepths[11] = 0; // obj_bup
	global.__objectDepths[12] = 0; // obj_bright
	global.__objectDepths[13] = 0; // obj_bdown
	global.__objectDepths[14] = 0; // obj_bleft
	global.__objectDepths[15] = 0; // obj_bmove
	global.__objectDepths[16] = 0; // obj_stopv


	global.__objectNames[0] = "obj_draw";
	global.__objectNames[1] = "obj_block";
	global.__objectNames[2] = "obj_border";
	global.__objectNames[3] = "obj_win";
	global.__objectNames[4] = "obj_push";
	global.__objectNames[5] = "obj_bpush";
	global.__objectNames[6] = "obj_switch";
	global.__objectNames[7] = "obj_wall";
	global.__objectNames[8] = "obj_persistent";
	global.__objectNames[9] = "obj_test_rm";
	global.__objectNames[10] = "obj_bparent";
	global.__objectNames[11] = "obj_bup";
	global.__objectNames[12] = "obj_bright";
	global.__objectNames[13] = "obj_bdown";
	global.__objectNames[14] = "obj_bleft";
	global.__objectNames[15] = "obj_bmove";
	global.__objectNames[16] = "obj_stopv";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
