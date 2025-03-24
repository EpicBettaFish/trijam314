extends RigidBody2D

@onready var unstuck = $Unstuck

func  _physics_process(delta: float) -> void:
	unstuck.global_position = global_position

func _on_left_body_entered(body: Node2D) -> void:
	if body != self:
		angular_velocity += 35
		linear_velocity.x += 100

func _on_right_body_entered(body: Node2D) -> void:
	if body != self:
		angular_velocity -= 35
		linear_velocity.x += 100
