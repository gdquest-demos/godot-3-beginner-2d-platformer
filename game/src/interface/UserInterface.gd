extends Node


onready var scene_tree: SceneTree = get_tree()
onready var score_label: Label = $ScoreLabel
onready var pause_overlay: ColorRect = $PauseOverlay


func _ready() -> void:
	PlayerData.connect("updated", self, "update_interface")
	update_interface()


func _on_RetryButton_button_up() -> void:
	scene_tree.reload_current_scene()
	toggle_game_pause()


func _on_QuitButton_button_up() -> void:
	scene_tree.quit()


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("pause"):
		return
	toggle_game_pause()


func update_interface() -> void:
	score_label.text = "Score: %s" % PlayerData.score


func toggle_game_pause() -> void:
	scene_tree.paused = not scene_tree.paused
	pause_overlay.visible = scene_tree.paused
