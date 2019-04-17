/// void save_region(xx, yy)

_xx = argument0;
_yy = argument1;

_region_file_name = "save/region/" + string(_xx) + "." + string(_yy) + ".r";

_region_file = file_text_open_write(_region_file_name);

//change regions to 256 by 256

for(i = 0; i < 16; ++i){
    for(j = 0; j < 16; ++j){
        _left = _xx + (j * 32);
        _top = _yy + (i * 32);
        _tile = tile_layer_find(1000000, _left, _top);
        _tile_index = get_tile_index(_tile);
        _background = tile_get_background(_tile);
        _background_name = background_get_name(_background);
        
        file_text_write_string(_region_file, string(_tile_index));
        file_text_writeln(_region_file);
        file_text_write_string(_region_file, _background_name);
        file_text_writeln(_region_file);
    }
}

file_text_close(_region_file);
