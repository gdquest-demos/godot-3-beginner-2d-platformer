extends Resource

signal updated

var score: = 0 setget set_score

func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")
