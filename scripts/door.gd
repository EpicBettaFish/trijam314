extends Node2D

var tween
@onready var doorCollider = $Collider

func activate() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(doorCollider, "position", Vector2(0, -21), 0.5)

func deactivate() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(doorCollider, "position", Vector2(0, 0), 0.5)
