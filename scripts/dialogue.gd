extends AudioStreamPlayer

var queue = []

func add_to_queue(array):
	var play_at_end = false
	if queue.is_empty():
		play_at_end = true
	for s in array:
		queue.append(s)
	if play_at_end:
		stream = queue.front()
		queue.remove_at(0)
		play()

func clear_queue():
	queue = []
	stop()

func _on_finished() -> void:
	if !queue.is_empty():
		await get_tree().create_timer(0.15)
		stream = queue.front()
		play()
		queue.remove_at(0)
