///vertex_wheat(vBuff, x, y, width, height, sub, depth, segments)

var vBuff = argument0;
var xx = argument1;
var yy = argument2;
var width = argument3;
var height = argument4;
var sub = argument5;
var v_depth = argument6;
var segments = argument7;

var seg_height = height / segments;

// BUG: For some reason uv texture coordinates don't like being fractions...
// Needs to be resolved in order to use sprite maps
var subimage_pos = 0;
var subimage_pos_next = 1;

for(var i = 0; i < segments; ++i){
    var x1 = xx;
    var y1 = yy - i * seg_height;
    var x2 = xx + width;
    var y2 = y1;
    var x3 = xx;
    var y3 = y1 - seg_height;
    var x4 = x2;
    var y4 = y3;
    
    var texcoord_base = 1.0 - i / segments;
    var texcoord_top = 1.0 - (i + 1) / segments;
    var base_weight = i / segments;
    var top_weight = (i + 1) / segments;
    
    // Triangle 1
    vertex_position_3d(vBuff, x1, y1, v_depth);
    vertex_texcoord(vBuff, subimage_pos, texcoord_base);
    vertex_colour(vBuff, c_white, 1);
    vertex_float1(vBuff, base_weight);
    
    vertex_position_3d(vBuff, x2, y2, v_depth);
    vertex_texcoord(vBuff, subimage_pos_next, texcoord_base);
    vertex_colour(vBuff, c_white, 1);
    vertex_float1(vBuff, base_weight);
    
    vertex_position_3d(vBuff, x3, y3, v_depth);
    vertex_texcoord(vBuff, subimage_pos, texcoord_top);
    vertex_colour(vBuff, c_white, 1);
    vertex_float1(vBuff, top_weight);
    
    // Triangle 2
    vertex_position_3d(vBuff, x2, y2, v_depth);
    vertex_texcoord(vBuff, subimage_pos_next, texcoord_base);
    vertex_colour(vBuff, c_white, 1);
    vertex_float1(vBuff, base_weight);
    
    vertex_position_3d(vBuff, x4, y4, v_depth);
    vertex_texcoord(vBuff, subimage_pos_next, texcoord_top);
    vertex_colour(vBuff, c_white, 1);
    vertex_float1(vBuff, top_weight);
    
    vertex_position_3d(vBuff, x3, y3, v_depth);
    vertex_texcoord(vBuff, subimage_pos, texcoord_top);
    vertex_colour(vBuff, c_white, 1);
    vertex_float1(vBuff, top_weight);
}
