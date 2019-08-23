extends "res://src/actors/PlatformActor.gd"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_left"):
		_linear_velocity.x = -movement_speed
	elif event.is_action_pressed("move_right"):
		_linear_velocity.x = movement_speed
	elif event.is_action_released("move_left") or event.is_action_released("move_right"):
		if Input.is_action_pressed("move_left"):
			_linear_velocity.x = -movement_speed
		elif Input.is_action_pressed("move_right"):
			_linear_velocity.x = movement_speed
		else:
			_linear_velocity.x = 0.0
	
	if event.is_action_pressed("jump"):
		if is_on_floor():
			_linear_velocity.y = -jump_impulse
	elif event.is_action_released("jump"):
		if _linear_velocity.y < 0.0:
			_linear_velocity.y = 0.0
