extends Area2D

class_name Player

signal spawn_laser(Laser, position)
signal player_took_damage(currentHp)
signal player_dead(position)

var move_direction = Vector2.ZERO
var Laser = preload("res://Projectiles/PlayerLaser.tscn")
@onready var LaserStartPoint = $"LaserStartPoint"
@onready var LaserSound = $LaserSound
@onready var HitSound = $HitSound

@export var speed = 300
@export var hp = 3

func _physics_process(delta):
	move_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	global_position.x += move_direction.x * speed * delta
	global_position.y += move_direction.y * speed * delta
	
	global_position.x = clamp(global_position.x,0,450)
	global_position.y = clamp(global_position.y,300,750)
	
	if Input.is_action_just_pressed("shoot"):
		LaserSound.play()
		emit_signal("spawn_laser", Laser, LaserStartPoint.global_position)
	pass

func shot():
	var laser = Laser.instantiate()
	laser.global_position = global_position
	add_child(laser)

func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		take_damage(area.damage)
	pass # Replace with function body.
	
func take_damage(_damage):
	hp -= _damage
	HitSound.play()
	emit_signal("player_took_damage", hp)
	if hp <= 0:
		emit_signal("player_dead", global_position)
		queue_free()
