extends Node


onready var level: Node2D = $Level
onready var level_portal: Area2D = $Level/Portal2D


func _ready() -> void:
	setup_connections()


func _on_LevelPortal_level_changed(next_level_scene: String) -> void:
	var next_level: Node2D = load(next_level_scene).instance()
	
	level.queue_free()
	yield(level, "tree_exited")
	
	add_child(next_level)
	level = next_level
	level_portal = level.get_node("Portal2D")
	
	setup_connections()


func setup_connections() -> void:
	level_portal.connect("level_changed", self, "_on_LevelPortal_level_changed")
