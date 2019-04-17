///create_new_world(seed)

_seed = string(argument0);

var _p = 0;
if(global.seed == ""){
    randomize();
    _seed = string(random(1000000000));
}

for(i = 0; i < string_length(_seed); ++i){
    _p += ord(string_char_at(_seed, i));
}

global.seed = _seed;
global.real_seed = _p;

_world_controller = instance_create(0, 0, obj_world_controller);
