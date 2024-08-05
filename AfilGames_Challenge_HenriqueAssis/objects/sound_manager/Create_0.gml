audio_group_load(ag_music);
audio_group_load(ag_sfx);

music_playing = snd_music_menu;
musics = [snd_music_menu, snd_music_gameplay];
sfxs = [snd_sfx_click, snd_sfx_select];

music_volume = 1;
sfx_volume = 1;

control = false;
music_target = 0;
sfx_loaded = false;

change_music_volume = function(_value) 
{
	music_volume = _value;
	audio_group_set_gain(ag_music, _value, 0);
}

change_sfx_volume = function(_value) 
{
	sfx_volume = _value;
	audio_group_set_gain(ag_music, _value, 0);
}