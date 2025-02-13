change_handle_value();

var _down_key = keyboard_check_pressed(vk_down);
var _right_key = keyboard_check_pressed(vk_right);
var _up_key = keyboard_check_pressed(vk_up);
var _left_key = keyboard_check_pressed(vk_left);

// para evitar que navegue mais de uma vez ao pressionar o botao de navegação
if (global.is_selecting && is_pressing_some_key(_down_key, _up_key))
{
	return;
}
else if (global.is_selecting && !is_pressing_some_key(_down_key, _up_key))
{
	global.is_selecting = false;
}

if (obj_ui_manager.current_selected != object_instance) return;

// selecionou o vizinho em baixo
if (_down_key && neighbour_down != 0)
{
	select_button(neighbour_down);
}

// selecionou o vizinho em cima
if (_up_key && neighbour_up != 0)
{
	select_button(neighbour_up);
}

// muda valores por teclado
if (_right_key && obj_ui_manager.current_selected == object_instance)
{
	change_value_by_keyboard(true);
}

if (_left_key && obj_ui_manager.current_selected == object_instance)
{
	change_value_by_keyboard(false);
}