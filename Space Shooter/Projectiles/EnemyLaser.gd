extends "res://Projectiles/Laser.gd"

func _ready():
	speed = (randi() % 500) + 500


func _on_area_entered(area):
	if area is Player:
		area.take_damage(damage)
		queue_free()
	pass # Replace with function body.
