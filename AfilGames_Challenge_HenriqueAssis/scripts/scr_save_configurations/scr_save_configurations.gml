function save_volumes()
{
	var _save_file_name = "configsave.txt";
	var _volumes_model = 
	{
		music_volume: global.music_volume,
		sfx_volume: global.sfx_volume,
	};
	
	var _json = json_stringify(_volumes_model);
	var _file = file_text_open_write(_save_file_name);
	
	file_text_write_string(_file, _json);
	
	file_text_close(_file);
}

function save_fullscreen()
{
	var _save_file_name = "fullscreensave.txt";
	
	var _file = file_text_open_write(_save_file_name);
	
	file_text_write_real(_file, global.is_fullscreen);
	
	file_text_close(_file);
}

function load_volumes()
{
	var _save_file_name = "configsave.txt";
	if (!file_exists(_save_file_name)) return;
	
	var _file = file_text_open_read(_save_file_name);
	
	var _json = file_text_read_string(_file);
	var _volumes_model = json_parse(_json);
	
	global.music_volume = _volumes_model.music_volume;
	global.sfx_volume = _volumes_model.sfx_volume;
	
	file_text_close(_file);
}

function load_fullscreen()
{
	var _save_file_name = "fullscreensave.txt";
	if (!file_exists(_save_file_name)) return;
	
	var _file = file_text_open_read(_save_file_name);
	
	var _value = file_text_read_real(_file);
	
	global.is_fullscreen = _value;
	
	file_text_close(_file);
}