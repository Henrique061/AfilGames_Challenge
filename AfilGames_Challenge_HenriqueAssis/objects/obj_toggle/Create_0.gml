is_active = false;

if (file_exists("fullscreensave.txt"))
{
	var _final_action = action_target;
	load_fullscreen()
	
	switch (_final_action)
	{
		case "fullscreen":
			is_active = global.is_fullscreen;
			break;
		default:
			break;
	}
}

toggle_clicked = function() 
{
	is_active = !is_active;
	if (!instance_exists(target_object.id)) return;
	
	var _final_value = is_active;
	var _final_action = action_target;
	// variáveis atribuídas no inspector
	with (target_object.id)
	{
		switch (_final_action)
		{
			case "fullscreen":
				toggle_fullscreen(_final_value);
				break;
			default:
				break;
		}
	}
}

is_pressing_some_key = function(_down, _right, _up, _left)
{
	if (_down || _right || _up || _left) 
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