extends StaticBody2D

@export var connectedNode: Node
@onready var sprite = $Sprite

var activated = false
var savedActivatedState = false

func _on_button_pushed_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Singleton.player_size == 2:
			activated = true
			connectedNode.activate()
			sprite.frame = 1

func saveCheckpoint() -> void:
	savedActivatedState = activated

func loadCheckpoint() -> void:
	if savedActivatedState == true:
		activated = true
		connectedNode.activate()
		sprite.frame = 1
	else:
		activated = false
		sprite.frame = 0
		connectedNode.deactivate()
