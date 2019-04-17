/// save_to_region(object, object_index)

_object = argument0;
_object_index = argument1;

_xx = _object.x div (32 * 16);
_yy = _object.y div (32 * 16);

_region_file_name = "save/region/" + string(_xx) + "." + string(_yy) + ".r";

//show_debug_message(string(_xx) + ", " + string(_yy));

_region_file = file_text_open_append(_region_file_name);

/*
Object file format:
object_type, x, y, depth, ...more later...
*/

_obj_name = object_get_name(_object_index);
_obj_x = string(_object.x);
_obj_y = string(_object.y);
_obj_depth = string(_object.depth);

_obj_string = _obj_name + "|" + _obj_x + "|" + _obj_y + "|" + 
              _obj_depth;

file_text_write_string(_region_file, _obj_string);
file_text_writeln(_region_file);

file_text_close(_region_file);
