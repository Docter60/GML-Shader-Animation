/// void save_game();

//Insert save settings ini here

// Save data to text files
if(!directory_exists("save")){
    directory_create("save");
}

if(!directory_exists("save/region")){
    directory_create("save/region");
}

save_region_terrain(0, 0);

with(obj_corn_vertex){
    save_to_region(self, object_index);
}
