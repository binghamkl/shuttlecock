extends Area2D




func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		#event.button_index == BUTTON_LEFT and 
		print(event.button_index)
		ToggleMusic()
	
func ToggleMusic():
	$AudioStreamPlayer.playing = !$AudioStreamPlayer.playing
	$MusicSprite.visible = $AudioStreamPlayer.playing
	$MuteMusicSprite.visible = !$AudioStreamPlayer.playing
	
