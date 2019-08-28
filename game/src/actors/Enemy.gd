extends "res://src/actors/Actor.gd"


export var score: = 100


func _ready() -> void:
	_linear_velocity.x = -speed.x


func get_hurt() -> void:
	PlayerData.score += score
	queue_free()


func _on_StompArea2D_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("player"):
		get_hurt()
