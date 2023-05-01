extends "res://Enemy/Enemy.gd"

@onready var spawnPosition = $"LaserSpawnPoint"
@onready var LaserSFX = $LaserSound
var Laser = preload("res://Projectiles/EnemyLaser.tscn")
signal spawn_laser(Laser, position)

func _on_Timer_timeout():
	LaserSFX.play()
	emit_signal("spawn_laser",Laser, spawnPosition.global_position)
	pass # Replace with function body.
