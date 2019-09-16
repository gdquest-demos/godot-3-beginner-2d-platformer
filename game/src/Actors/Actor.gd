extends KinematicBody2D
class_name Actor


const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(400.0, 500.0)
export var gravity: = 3500.0

var _velocity: = Vector2.ZERO


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
