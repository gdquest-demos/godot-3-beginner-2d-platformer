extends Node

signal updated
signal died

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths

func reset():
	score = 0
	emit_signal("updated")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
