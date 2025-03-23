extends StaticBody2D

@export var connectedNode: Node
var itemsPushingButton: int = 0

func _on_button_pushed_body_entered(body: Node2D) -> void:
	if body.is_in_group("canPushButton"):
		itemsPushingButton += 1
		if itemsPushingButton == 1:
			connectedNode.activate()

func _on_button_pushed_body_exited(body: Node2D) -> void:
	if body.is_in_group("canPushButton"):
		itemsPushingButton -= 1
		if itemsPushingButton == 0:
			connectedNode.deactivate()
