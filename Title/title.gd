extends Node

@export var mainScene: PackedScene

func _enter_tree():
	# Binds buttons
	%MainButton.pressed.connect(_on_main_button_pressed)
	%QuitButton.pressed.connect(_on_quit_button_pressed)
	
func _on_main_button_pressed():
	# Move to main scene
	get_tree().change_scene_to_packed(mainScene)
	
func _on_quit_button_pressed():
	# Quit application
	get_tree().quit()
