draw_self();

if (!is_active)
{
	var _alpha = 1.0;
	if (obj_ui_manager.current_selected == object_instance)
		_alpha = 0.6;
		
	draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width, sprite_height, x, y , 1, 1, c_black, _alpha);
}