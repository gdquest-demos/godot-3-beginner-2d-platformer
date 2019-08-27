extends "res://src/actors/PlatformActor.gd"

export var score: = 100

func _ready() -> void:
	_linear_velocity.x = -movement_speed


func handle_collision() -> void:
	if get_slide_count() < 1:
		return
	var collider: = get_slide_collision(0).collider
	var normal: = get_slide_collision(0).normal
	
	if is_on_wall():
		if collider.is_in_group("player"):
			collider.get_hurt()
		_linear_velocity.x = movement_speed * normal.x
	elif is_on_floor() and collider.is_in_group("player"):
		collider.get_hurt()
		


func get_hurt() -> void:
	PlayerData.score += score
	queue_free()
