event_inherited();

var _buttons_layer = "Buttons";
var _popupbg_layer = "Popup_bg";
var _popupbuttons_layer = "Popup_buttons";

instance_activate_layer(_buttons_layer);
instance_deactivate_layer(_popupbg_layer);
instance_deactivate_layer(_popupbuttons_layer);

with (obj_ui_manager)
{
	select_ui(inst_3E0E1A64);
}