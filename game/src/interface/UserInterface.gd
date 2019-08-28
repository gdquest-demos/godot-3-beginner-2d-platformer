extends Node


onready var score_label: = $ScoreLabel
onready var pause_overlay: = $PauseOverlay


func _ready() -> void:
	PlayerData.connect("updated", self, "update_interface")
	update_interface()


func _on_RetryButton_button_up() -> void:
	get_tree().reload_current_scene()


func _on_QuitButton_button_up() -> void:
	get_tree().quit()


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("pause"):
		return
	toggle_game_pause()
	get_tree().set_input_as_handled()


func update_interface() -> void:
	score_label.text = "Score: %s" % PlayerData.score


func toggle_game_pause() -> void:
	get_tree().paused = not get_tree().paused
	pause_overlay.visible = get_tree().paused
