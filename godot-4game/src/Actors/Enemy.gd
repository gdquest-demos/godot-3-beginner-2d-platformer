extends Actor


@onready var stomp_area: Area2D = $StompArea2D

@export var score: = 100


func _ready() -> void:
	velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	velocity.x *= -1 if is_on_wall() else 1
	move_and_slide()


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	PlayerData.score += score
	queue_free()
