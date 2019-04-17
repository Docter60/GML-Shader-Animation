///add_wheat(xx, yy)
with(obj_wheat_controller){
    _xx = argument0;
    _yy = argument1;
    
    randomize();

    _vBuff = vertex_create_buffer();
    vertex_begin(_vBuff, format);
    for(i = 0.0; i < density; ++i){
        x_strand = random(32) + _xx;
        y_strand = _yy + i * density_ratio;
        vertex_wheat(_vBuff, x_strand, y_strand, width, height, 4.0, -y_strand, segments);
    }
    vertex_end(_vBuff);
    vertex_freeze(_vBuff);
    ds_list_add(wheat_list, _vBuff);
}


