extends Area2D

export (String, FILE, "*.tscn") var next_scene: String

func _on_body_entered(body: PhysicsBody2D) -> void:
	get_tree().change_scene(next_scene)
