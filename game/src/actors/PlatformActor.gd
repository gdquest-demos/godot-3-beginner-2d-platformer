extends KinematicBody2D


const SNAP_DIRECTION: = Vector2.DOWN
const FLOOR_NORMAL: = Vector2.UP

export var movement_speed: = 400.0
export var gravity: = 3500.0
export var jump_impulse: = 500.0

var _linear_velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_linear_velocity = move_and_slide_with_snap(_linear_velocity, SNAP_DIRECTION, FLOOR_NORMAL)
	apply_gravity(delta)
	if get_slide_count() > 0:
		handle_collision()


func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		_linear_velocity.y += gravity * delta


func handle_collision() -> void:
	pass


func get_hurt() -> void:
	pass