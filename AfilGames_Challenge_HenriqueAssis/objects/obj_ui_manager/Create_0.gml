// o id do obj que está selecionado atualmente na ui
current_selected = 0;
// o id do obj que estava selecionado antes
previous_selected = 0;
global.is_selecting = false;

select_ui = function(_target_object)
{
	global.is_selecting = true;
	previous_selected = current_selected;
	current_selected = _target_object;
	
	// mudando alpha do botao selecionado
	if (current_selected == 0) return;
	if (!instance_exists(current_selected.id)) return;
	with (current_selected.id)
	{
		audio_play_sound(snd_sfx_select, 1000, false);
		image_alpha = 0.6;
	}
	
	// retornando o alfa original do botao que estava selecionado
	if (previous_selected == 0) return;
	if (!instance_exists(previous_selected.id)) return;
	with (previous_selected.id)
	{
		image_alpha = 1;
	}
}