extends "res://actors/PlatformActor.gd"

func _ready() -> void:
	_linear_velocity.x = -movement_speed

 
func _physics_process(delta: float) -> void:
	if is_on_wall():
		var collision_normal: = get_slide_collision(0).normal
		_linear_velocity.x = movement_speed * collision_normal.x
