global.is_fullscreen = false;
var _configurations_layer = "Configurations";
var _popupbg_layer = "Popup_bg";
var _popupbuttons_layer = "Popup_buttons";

instance_deactivate_layer(_configurations_layer);
instance_deactivate_layer(_popupbg_layer);
instance_deactivate_layer(_popupbuttons_layer);

var _save_file_name = "fullscreensave.txt";
if (file_exists(_save_file_name))
{
	load_fullscreen();
	alarm[0] = 10;
}
else 
{
	save_fullscreen();	
}

toggle_fullscreen = function(_is_active)
{
	global.is_fullscreen = _is_active;
	window_set_fullscreen(_is_active);
	save_fullscreen();
}