extends RayCast2D

signal stomped(stomped_object, stomp_hop_impulse)

export var stomp_hop_impulse: = 600.0

func _physics_process(delta: float) -> void:
	if not is_colliding():
		return
	var collision_normal: = get_collision_normal()
	if collision_normal == Vector2.UP:
		emit_signal("stomped", get_collider(), stomp_hop_impulse)
