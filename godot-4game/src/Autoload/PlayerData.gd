extends Node


signal updated
signal died
signal reset

var score: = 0: set = set_score
var deaths: = 0: set = set_deaths


func reset_data():
	self.score = 0
	self.deaths = 0
	reset.emit()


func set_score(new_score: int) -> void:
	score = new_score
	updated.emit()


func set_deaths(new_value: int) -> void:
	deaths = new_value
	died.emit()
