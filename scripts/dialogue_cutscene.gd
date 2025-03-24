extends Area2D

@export var streams: Array[AudioStream]


func _on_body_entered(body: Node2D) -> void:
	body.dialogue.add_to_queue(streams)
	await get_tree().physics_frame
	queue_free()
