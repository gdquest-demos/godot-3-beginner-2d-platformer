tool
extends Area2D


export(String, FILE, "*.tscn") var next_level


func _on_body_entered(body: PhysicsBody2D):
	teleport()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_level == "" else ""


func teleport() -> void:
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(next_level)
