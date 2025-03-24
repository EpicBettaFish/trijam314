extends StaticBody2D

@export var connectedNode: Node

func _on_lever_handle_body_entered(body: Node2D) -> void:
	if body.is_in_group("canPushButton"):
		$LeverBase.frame = 1
		connectedNode.activate()
		$LeverHandle/CollisionShape2D.queue_free()
