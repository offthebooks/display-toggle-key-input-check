extends Node2D

@onready var color_rect = $ColorRect
var time_since_enter = 0.5

func _process(delta):
	time_since_enter += delta
	
	color_rect.visible = false if time_since_enter >= 0.5 else true
	
	if Input.is_action_just_pressed("test_enter"):
		time_since_enter = 0
		
	if Input.is_action_just_pressed("test_space"):
		var mode = DisplayServer.WINDOW_MODE_FULLSCREEN
		
		if DisplayServer.window_get_mode() == mode:
			mode = DisplayServer.WINDOW_MODE_WINDOWED
			
		DisplayServer.window_set_mode(mode)
