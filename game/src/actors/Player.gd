extends "res://src/actors/Actor.gd"


export var stomp_hop_force: = 600.0


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy-kill"):
		queue_free()
	elif area.is_in_group("enemy-stomp"):
		_linear_velocity = stomp(_linear_velocity)


func _unhandled_input(event: InputEvent) -> void:
	if not is_valid_input(event):
		return
	
	var is_jump_interrupted: = event.is_action_released("jump") and _linear_velocity.y < 0
	var direction: = get_direction()
	_linear_velocity = move_by_direction(_linear_velocity, direction, speed, is_jump_interrupted)


func is_valid_input(event: InputEvent) -> bool:
	return event.is_action("move_left") or event.is_action("move_right") or event.is_action("jump")


func get_direction() -> Vector2:
    return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() else 0.0
	)


func move_by_direction(linear_velocity: Vector2, direction: Vector2, speed: Vector2, is_jump_interrupted: bool) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y = out.y if direction.y == 0 else speed.y * direction.y
	out.y = 0.0 if is_jump_interrupted else out.y
	return out


func stomp(linear_velocity: Vector2) -> Vector2:
	return Vector2(linear_velocity.x, linear_velocity.y - stomp_hop_force)
