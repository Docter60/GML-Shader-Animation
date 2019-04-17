/// get_tile_index(tile)

_tile = argument0;
_background = tile_get_background(_tile);
_bg_width = background_get_width(_background);
_row_size = _bg_width / 32;
_left = tile_get_left(_tile) / 32;
_top = tile_get_top(_tile) / 32;
_index = _row_size * _top + _left;

return _index;
