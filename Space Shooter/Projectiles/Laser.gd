extends Area2D

@export var speed = 1000
@export var damage = 1
@export_range(-1, 1) var vertical_direction = 1

func _physics_process(delta):
	global_position.y += speed * vertical_direction * delta
	pass
