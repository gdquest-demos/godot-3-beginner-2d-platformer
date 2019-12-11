extends Node


signal updated
signal died
signal reset

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths


func reset():
	self.score = 0
	self.deaths = 0
	emit_signal("reset")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
