audio_group_load(ag_music);
audio_group_load(ag_sfx);

music_playing = snd_music_menu;
musics = [snd_music_menu, snd_music_gameplay];
sfxs = [snd_sfx_click, snd_sfx_select];

global.music_volume = 1;
global.sfx_volume = 1;

control = false;
music_target = 0;
sfx_loaded = false;

var _save_file_name = "configsave.txt";
if (file_exists(_save_file_name))
{
	load_volumes();
	audio_group_set_gain(ag_music, global.music_volume, 0);
	audio_group_set_gain(ag_sfx, global.sfx_volume, 0);
}
else 
{
	save_volumes();	
}

change_music_volume = function(_value) 
{
	global.music_volume = _value;
	audio_group_set_gain(ag_music, _value, 0);
	save_volumes();
}

change_sfx_volume = function(_value) 
{
	global.sfx_volume = _value;
	audio_group_set_gain(ag_sfx, _value, 0);
	save_volumes();
}