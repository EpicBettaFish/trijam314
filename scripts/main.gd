extends Node2D
@onready var elementsParent = $Elements
@onready var menu: CanvasLayer = $Menu

var savedPlayerPos = Vector2(0,0)
var saved_machine_speed = 1
var saved_jump_height = 1
var saved_player_size = 1


func _ready() -> void:
	checkpoint()

func checkpoint() -> void:
	savedPlayerPos = $Player.global_position
	saved_machine_speed = Singleton.machine_speed
	saved_jump_height = Singleton.jump_height
	saved_player_size = Singleton.player_size
	for i in elementsParent.get_children():
		if i.is_in_group("savesAtCheckpoints"):
			i.saveCheckpoint()

func die() -> void:
	$Player.global_position = savedPlayerPos
	Singleton.machine_speed = saved_machine_speed
	Singleton.jump_height = saved_jump_height
	Singleton.player_size = saved_player_size
	menu.machine_speed_slider.value = saved_machine_speed
	menu.jump_height_slider.value = saved_jump_height
	menu.player_size_slider.value = saved_player_size
	for i in elementsParent.get_children():
		if i.is_in_group("savesAtCheckpoints"):
			i.loadCheckpoint()
