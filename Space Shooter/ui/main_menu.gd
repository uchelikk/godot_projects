extends Control

@onready var World = preload("res://World.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_packed(World)
	pass


func _on_quit_pressed():
	get_tree().quit()
