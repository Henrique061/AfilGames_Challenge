var _down_key = keyboard_check_pressed(vk_down);
var _right_key = keyboard_check_pressed(vk_right);
var _up_key = keyboard_check_pressed(vk_up);
var _left_key = keyboard_check_pressed(vk_left);
var _enter_key = keyboard_check_pressed(vk_enter);

// para evitar que navegue mais de uma vez ao pressionar o botao de navegação
if (global.is_selecting && is_pressing_some_key(_down_key, _right_key, _up_key, _left_key))
{
	return;
}
else if (global.is_selecting && !is_pressing_some_key(_down_key, _right_key, _up_key, _left_key))
{
	global.is_selecting = false;
}

if (obj_ui_manager.current_selected != object_instance) return;

// selecionou o vizinho em baixo
if (_down_key && neighbour_down != 0)
{
	select_button(neighbour_down);
}

// selecionou o vizinho da direita
if (_right_key && neighbour_right != 0)
{
	select_button(neighbour_right);
}

// selecionou o vizinho em cima
if (_up_key && neighbour_up != 0)
{
	select_button(neighbour_up);
}

// selecionou o vizinho da esquerda
if (_left_key && neighbour_left != 0)
{
	select_button(neighbour_left);
}

// apertou enter no botão
if (!_enter_key) return;
if (obj_ui_manager.current_selected != object_instance) return;

click_button();