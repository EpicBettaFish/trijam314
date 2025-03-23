extends StaticBody2D

@export var connectedNode: Node
@onready var sprite = $Sprite
var itemsPushingButton: int = 0

func _on_button_pushed_body_entered(body: Node2D) -> void:
	if body.is_in_group("canPushButton"):
		itemsPushingButton += 1
		if itemsPushingButton == 1:
			connectedNode.activate()
			sprite.frame = 1

func _on_button_pushed_body_exited(body: Node2D) -> void:
	if body.is_in_group("canPushButton"):
		itemsPushingButton -= 1
		if itemsPushingButton == 0:
			connectedNode.deactivate()
			sprite.frame = 0
