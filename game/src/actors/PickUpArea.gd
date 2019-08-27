extends Area2D

const Coin: = preload("res://src/objects/Coin.gd")

func _on_area_entered(area: Area2D) -> void:
	if area is Coin:
		PlayerData.score += area.score
		area.queue_free()
