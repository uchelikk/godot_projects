extends Area2D

signal enemy_died(_point, _position)

@export var speed = 150
@export var hp = 1
@export var damage = 1
@export var point = 10

@onready var HitSound = $HitSound


func _physics_process(delta):
	global_position.y += speed * delta
	pass

func _on_Enemy_area_entered(area):
	if area is Player:
		take_damage(area.hp)

func take_damage(_damage):
	hp -= _damage
	HitSound.play()
	if hp <=0:
		emit_signal("enemy_died", point, global_position)
		queue_free()
