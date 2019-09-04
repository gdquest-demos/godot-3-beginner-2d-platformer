extends Control


onready var data_label: Label = $DataLabel


func _ready() -> void:
	data_label.text = data_label.text % [PlayerData.score, PlayerData.deaths]
