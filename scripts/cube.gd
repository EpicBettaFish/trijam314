extends RigidBody2D

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
