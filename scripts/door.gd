extends Node2D

var tween

func activate() -> void:
	if tween:
		tween.kill()
