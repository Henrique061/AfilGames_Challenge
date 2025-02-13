handle_value = 0.5;
handle_alpha = 1.0;
is_moving_handle = false;

if (file_exists("configsave.txt"))
{
	var _final_action = target_action;
	load_volumes()
	
	switch (_final_action)
	{
		case "music":
			handle_value = global.music_volume;
			break;
		case "sfx":
			handle_value = global.sfx_volume;
			break;
		default:
			break;
	}
}

// cria o sprite da barra e do handle do slider em sua devida posicao
draw_slider = function() 
{
	draw_self();
	
	var _bar_alpha = 1.0;
	if (obj_ui_manager.current_selected == object_instance)
		_bar_alpha = 0.6;
	
	// parte preenchida do slider
	draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width * (1 - handle_value), sprite_height, get_handle_x_pos(), y - sprite_yoffset, 1, 1, c_grey, _bar_alpha);
	
	// sprite do handle
	draw_sprite_ext(spr_slider_handle, 0, get_handle_x_pos(), y, 1, 1, 0, c_white, handle_alpha);
}

// verifica se o mouse está por cima do slider
is_slider_hovered = function() 
{
	var _handle_size = 28;
	var _is_mouse_hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
	
	// verifica se o mouse não está no handle caso ele não esteja na barra
	if (!_is_mouse_hover)
	{
		_is_mouse_hover = point_in_circle(mouse_x, mouse_y, get_handle_x_pos(), y, _handle_size);
	}
	
	// muda alfa do handle se estiver com o mouse sobre ou movendo o slider
	if (_is_mouse_hover || is_moving_handle)
	{
		handle_alpha = 0.6;
	}
	else 
	{
		handle_alpha = 1.0;
	}
	
	if (_is_mouse_hover && obj_ui_manager.current_selected != object_instance)
		obj_ui_manager.select_ui(object_instance);
	
	return _is_mouse_hover;
}

// altera o valor do handle do slider
change_handle_value = function() 
{
	if (is_clicked_slider())
	{
		is_moving_handle = true;
	}
	
	if (is_moving_handle && mouse_check_button_released(mb_left))
	{
		is_moving_handle = false;
	}
	
	if (!is_moving_handle) return;

	handle_value = (mouse_x - x) / sprite_width;
	handle_value = clamp(handle_value, 0, 1);
	
	realize_action(handle_value, target_action);
}

change_value_by_keyboard = function(_is_incrementing)
{
	if (_is_incrementing && handle_value < 1)
	{
		handle_value += 0.05;
	}
	
	else if (!_is_incrementing && handle_value > 0)
	{
		handle_value -= 0.05;
	}
	
	handle_value = clamp(handle_value, 0, 1);
	
	audio_play_sound(snd_sfx_select, 1000, false);
	realize_action(handle_value, target_action);
}

realize_action = function(_final_value, _final_action)
{
	if (!instance_exists(target_object.id)) return;
	
	// variaveis atribuidos no inspector
	with(target_object.id)
	{
		switch (_final_action)
		{
			case "music":
				change_music_volume(_final_value);
				break;
			case "sfx":
				change_sfx_volume(_final_value);
				break;
			default:
				break;
		}
	}
}

// aux functions
function get_handle_x_pos()
{
	return x + (sprite_width * handle_value);
}

function is_clicked_slider() 
{
	return is_slider_hovered() && mouse_check_button_pressed(mb_left);
}

is_pressing_some_key = function(_down, _up)
{
	if (_down || _up) 
		return true;
		
	return false;
}

select_button = function(_next_target)
{
	with (obj_ui_manager)
	{
		select_ui(_next_target);	
	}
}