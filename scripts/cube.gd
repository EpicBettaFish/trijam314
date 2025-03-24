extends RigidBody2D

var savedPos

func _on_left_body_entered(body: Node2D) -> void:
	if body != self:
		angular_velocity += 35
		linear_velocity.x += 100
		linear_velocity.y -= 40

func _on_right_body_entered(body: Node2D) -> void:
	if body != self:
		angular_velocity -= 35
		linear_velocity.x += 100
		linear_velocity.y -= 40

func saveCheckpoint() -> void:
	savedPos = global_position

func loadCheckpoint() -> void:
	global_transform.origin = savedPos
	linear_velocity = Vector2(0,0)
	angular_velocity = 0


func _on_die_area_entered(area: Area2D) -> void:
	if "Death" in str(area):
		global_transform.origin = savedPos
		linear_velocity = Vector2(0,0)
		angular_velocity = 0
