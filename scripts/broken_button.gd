extends StaticBody2D

@export var connectedNode: Node
@onready var sprite = $Sprite

func _on_button_pushed_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Singleton.player_size == 2:
			connectedNode.activate()
			sprite.frame = 1
