extends Node2D
@onready var elementsParent = $Elements

var savedPlayerPos = Vector2(0,0)

func _ready() -> void:
	checkpoint()

func checkpoint() -> void:
	savedPlayerPos = $Player.global_position
	for i in elementsParent.get_children():
		if i.is_in_group("savesAtCheckpoints"):
			i.saveCheckpoint()

func die() -> void:
	$Player.global_position = savedPlayerPos
	for i in elementsParent.get_children():
		if i.is_in_group("savesAtCheckpoints"):
			i.loadCheckpoint()
