extends KinematicBody2D


const SNAP_DIRECTION: = Vector2.DOWN
const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(400.0, 500.0)
export var gravity: = 3500.0

var _linear_velocity: = Vector2.ZERO


func _physics_process(delta: float) -> void:
	_linear_velocity = move_and_slide_with_snap(_linear_velocity, SNAP_DIRECTION, FLOOR_NORMAL)
	_linear_velocity = move_by_gravity(_linear_velocity, gravity, delta)


func move_by_gravity(linear_velocity: Vector2, gravity: float, delta: float) -> Vector2:
	var out: = linear_velocity
	out.y += 0 if is_on_floor() else gravity * delta
	return out
