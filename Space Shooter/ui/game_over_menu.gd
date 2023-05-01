extends Control

@onready var ScoreLabel = $Score

func _on_retry_button_pressed():
	get_tree().reload_current_scene()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")

func update_score(_score):
	ScoreLabel.text = "Score: " + str(_score)
