tool
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene


func _on_body_entered(body: PhysicsBody2D):
	teleport()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if not next_scene else ""


func teleport() -> void:
	get_tree().paused = true
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")
	get_tree().paused = false
	get_tree().change_scene_to(next_scene)
