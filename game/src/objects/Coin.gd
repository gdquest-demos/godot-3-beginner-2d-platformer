extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 100


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("player"):
		picked()


func picked() -> void:
	PlayerData.score += score
	anim_player.play("picked")
