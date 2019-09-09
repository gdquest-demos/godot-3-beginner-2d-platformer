extends "res://src/actors/Actor.gd"


onready var stomp_area: Area2D = $StompArea2D

export var score: = 100


func _ready() -> void:
	set_physics_process(false)
	_linear_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_linear_velocity.x *= -1 if is_on_wall() else 1


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	PlayerData.score += score
	queue_free()
