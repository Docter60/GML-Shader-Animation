/// generate_world(xx, yy)

_xx = argument0;
_yy = argument1;

_real_seed = global.real_seed;

_file_name = get_region_filename(_xx, _yy);

if(!file_exists(_file_name)){
    // File does not exist, safe to generate
} else {
    // This part of the world has already been created
    show_error("World file already exists for:" + _file_name, true);
}
