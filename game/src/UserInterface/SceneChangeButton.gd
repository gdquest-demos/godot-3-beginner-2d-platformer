tool
extends Button


export var next_scene: PackedScene


func _on_button_up() -> void:
	PlayerData.reset()
	get_tree().change_scene_to(next_scene)


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if not next_scene else ""
