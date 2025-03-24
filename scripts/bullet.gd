extends Area2D

var myTurret
var SPEED = 5.0

func _physics_process(delta: float) -> void:
	match Singleton.machine_speed:
		0.0:
			SPEED = 0.25
		1.0:
			SPEED = 5.0
		2.0:
			SPEED = 6.0
	
	global_position += Vector2(SPEED,0).rotated(rotation)

func _on_body_entered(body: Node2D) -> void:
	if myTurret != body:
		queue_free()
