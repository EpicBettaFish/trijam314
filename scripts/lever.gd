extends StaticBody2D

@export var connectedNode: Node
var activated = false

var savedActivatedState = false

func _on_lever_handle_body_entered(body: Node2D) -> void:
	if body.is_in_group("canPushButton"):
		$LeverBase.frame = 1
		activated = true
		connectedNode.activate()
		$LeverHandle/CollisionShape2D.set_deferred("disabled", true)

func saveCheckpoint() -> void:
	savedActivatedState = activated

func loadCheckpoint() -> void:
	if savedActivatedState == false:
		$LeverBase.frame = 0
		activated = false
		connectedNode.deactivate()
		$LeverHandle/CollisionShape2D.set_deferred("disabled", false)
	else:
		$LeverBase.frame = 1
		activated = true
		connectedNode.activate()
		$LeverHandle/CollisionShape2D.set_deferred("disabled", true)
