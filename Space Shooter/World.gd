extends Node2D

var score = 0

@onready var HUD = $HUD
@onready var Player = $Player
@onready var EnemySpawner = $EnemySpawner
@onready var GameOverMenu = $GameOverMenu

var explode_particle = preload("res://particles/explode.tscn")

func _ready():
	GameOverMenu.visible = false
	score = 0
	HUD.update_score(score)
	HUD.update_hp(Player.hp)

func _on_enemy_died(point, _global_position):
	var _explode = explode_particle.instantiate()
	_explode.global_position = _global_position
	$EffectsLayer.add_child(_explode)
	score += point
	HUD.update_score(score)

func on_spawn_laser(Laser, _position):
	var laser = Laser.instantiate()
	laser.global_position = _position
	add_child(laser)

func _on_spawn_enemy(enemy_scene, _position):
	var enemy = enemy_scene.instantiate()
	if enemy.has_signal("spawn_laser"):
		enemy.spawn_laser.connect(on_spawn_laser)
	enemy.global_position = _position
	enemy.enemy_died.connect(_on_enemy_died)
	add_child(enemy)

func _on_player_took_damage(_currentHp):
	HUD.update_hp(_currentHp)

func _on_player_dead(_position):
	var _explode = explode_particle.instantiate()
	_explode.global_position = _position
	$EffectsLayer.add_child(_explode)
	await get_tree().create_timer(3).timeout
	game_over()
	
func game_over():
	EnemySpawner.stop()
	GameOverMenu.update_score(score)
	GameOverMenu.visible = true
