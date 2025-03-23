extends Node

var volume = 50
var machine_speed = 1
var jump_height = 1
var player_size = 1


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("f11"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
