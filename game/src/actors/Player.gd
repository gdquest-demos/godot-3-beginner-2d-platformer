extends "res://src/actors/PlatformActor.gd"

signal died

export var stomp_hop_force: = 600.0


func handle_collision() -> void:
	var collider: = get_slide_collision(0).collider
	var normal: = get_slide_collision(0).normal
	
	if normal == Vector2.UP and collider.is_in_group("enemy"):
		stomp(collider)


func stomp(target: CollisionObject2D) -> void:
	target.get_hurt()
	_linear_velocity.y += -stomp_hop_force


func get_hurt() -> void:
	emit_signal("died")
	queue_free()


func _unhandled_input(event: InputEvent) -> void:
	if not (event.is_action("move_left") or event.is_action("move_right") or event.is_action("jump")):
		return
	
	var is_jump_interrupted: = event.is_action_released("jump") and _linear_velocity.y < 0.0
	var direction: = get_direction()
	_linear_velocity.x = movement_speed * direction.x
	_linear_velocity.y = (
		jump_impulse * direction.y
		if direction.y != 0.0 else 0.0
		if is_jump_interrupted else _linear_velocity.y
    )
	get_tree().set_input_as_handled()


func get_direction() -> Vector2:
    var direction: = Vector2(
        Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
        -Input.get_action_strength("jump")
      )
    direction.y = direction.y if is_on_floor() else 0.0
    return direction
