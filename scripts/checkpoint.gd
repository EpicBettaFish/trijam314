extends Area2D

@export var isDeath = false


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if !isDeath:
			get_parent().checkpoint()
			queue_free()
		else:
			get_parent().die()
