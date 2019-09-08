extends KinematicBody2D


const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(400.0, 500.0)
export var gravity: = 3500.0

var _linear_velocity: = Vector2.ZERO


func _physics_process(delta: float) -> void:
	_linear_velocity.y += gravity * delta
	_linear_velocity.y = move_and_slide(_linear_velocity, FLOOR_NORMAL).y
