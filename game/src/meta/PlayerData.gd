extends Node

signal updated

var score: = 0 setget set_score

func reset():
	score = 0
	emit_signal("updated")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")
