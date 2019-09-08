tool
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export(String, FILE, "*.tscn") var next_level_scene


func _on_body_entered(body: PhysicsBody2D):
	teleport()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_level_scene == "" else ""


func teleport() -> void:
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")
	get_tree().change_scene(next_level_scene)
