select_button = function(_next_target)
{
	with (obj_ui_manager)
	{
		select_ui(_next_target);	
	}
}

click_button = function()
{
	y = ystart + 4;
	audio_play_sound(snd_sfx_click, 1000, false);
	alarm[0] = 5
}

is_pressing_some_key = function(_down, _right, _up, _left)
{
	if (_down || _right || _up || _left) 
		return true;
		
	return false;
}