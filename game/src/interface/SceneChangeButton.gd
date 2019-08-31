tool
extends Button

export(String, FILE, "*.tscn") var next_screen_scene

func _on_button_up() -> void:
	get_tree().change_scene(next_screen_scene)


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_screen_scene == "" else ""
