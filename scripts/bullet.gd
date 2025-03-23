extends Area2D

var myTurret
const SPEED = 5.0

func _physics_process(delta: float) -> void:
	global_position += Vector2(SPEED,0).rotated(rotation)

func _on_body_entered(body: Node2D) -> void:
	if myTurret != body:
		queue_free()
