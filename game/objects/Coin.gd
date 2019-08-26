extends Area2D

const PlayerData: = preload("res://meta/PlayerData.gd")

export var player_data: Resource = preload("res://meta/PlayerData.tres") as PlayerData
export var score: = 100


func _on_area_entered(area: Area2D) -> void:
	player_data.score += score
	queue_free()
