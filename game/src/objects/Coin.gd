extends Area2D


export var score: = 100

const TWEEN_FINAL_POSITION = Vector2(0, -50)
const TWEEN_DURATION = 0.25


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("player"):
		get_picked()


func get_picked() -> void:
	PlayerData.score += score
	
	$Tween.interpolate_property(self, "position", position,
			position + TWEEN_FINAL_POSITION, TWEEN_DURATION, Tween.TRANS_BACK, Tween.EASE_IN)
	var transparent_color: = modulate
	transparent_color.a = 0.0
	$Tween.interpolate_property(self, "modulate", modulate,
			transparent_color, TWEEN_DURATION, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
	yield($Tween, "tween_all_completed")
	queue_free()
