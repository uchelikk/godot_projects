extends Node2D

signal spawn_enemy(enemy_scene, position)
var diver_enemy = preload("res://Enemy/DiverEnemy.tscn")
var normal_enemy = preload("res://Enemy/NormalEnemy.tscn")
var shooting_enemy = preload("res://Enemy/ShootingEnemy.tscn")

@export var enemies: Array[PackedScene]
@onready var spawn_positions = $"SpawnPositions".get_children()
@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.start()

func _on_spawn_timer_timeout():
	random_enemy()

func random_enemy():
	var _random_enemy = enemies[randi()%enemies.size()]
	var _random_index = randi() % spawn_positions.size()
	emit_signal("spawn_enemy", _random_enemy, spawn_positions[_random_index].global_position)

func stop():
	spawn_timer.stop()

func start():
	spawn_timer.start()
