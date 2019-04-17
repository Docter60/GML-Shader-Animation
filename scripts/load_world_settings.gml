if(!directory_exists("save")){
    directory_create("save");
}

ini_open("save/settings.ini");

global.seed = "0"

ini_close();
