extends "res://src/actors/Actor.gd"


export var score: = 100


func _ready() -> void:
	set_physics_process(false)
	_linear_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_linear_velocity.x *= -1 if is_on_wall() else 1


func _on_StompArea2D_area_entered(area: PhysicsBody2D) -> void:
	die()


func die() -> void:
	PlayerData.score += score
	queue_free()
