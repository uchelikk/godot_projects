extends "res://Projectiles/Laser.gd"

func _on_PlayerLaser_area_entered(area):
	if area.is_in_group("enemy"):
		area.take_damage(damage)
		queue_free()
