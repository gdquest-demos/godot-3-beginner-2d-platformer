tool
extends Area2D


signal level_changed(next_level_scene)

export(String, FILE, "*.tscn") var next_level_scene


func _on_body_entered(body: PhysicsBody2D):
	teleport()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_level_scene == "" else ""


func teleport() -> void:
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	emit_signal("level_changed", next_level_scene)
