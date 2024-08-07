event_inherited();

var _buttons_layer = "Buttons";
var _popupbg_layer = "Popup_bg";
var _popupbuttons_layer = "Popup_buttons";

instance_deactivate_layer(_buttons_layer);
instance_activate_layer(_popupbg_layer);
instance_activate_layer(_popupbuttons_layer);

with (obj_ui_manager)
{
	select_ui(inst_5A91AF9);
}