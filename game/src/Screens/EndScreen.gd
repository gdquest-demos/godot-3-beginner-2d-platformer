extends Control


onready var result: Label = $Result


func _ready() -> void:
	result.text = result.text % [PlayerData.score, PlayerData.deaths]
