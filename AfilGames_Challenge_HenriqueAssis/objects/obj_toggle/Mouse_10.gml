var _final_target = object_instance;

if (obj_ui_manager.current_selected == _final_target) return;

with (obj_ui_manager)
{
	select_ui(_final_target);
}