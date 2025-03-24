extends StaticBody2D

@onready var bulletDir = $BULLETDIR
@export var shootingInterval = 0.2
@onready var fastCollider = $FastCollider

var bulletScene = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	timerLoop()


func timerLoop() -> void:
	await get_tree().create_timer(shootingInterval).timeout
	shoot()
	timerLoop()

func shoot() -> void:
	var newBullet = bulletScene.instantiate()
	newBullet.rotation = bulletDir.rotation
	newBullet.myTurret = self
	newBullet.global_position = $BULLETDIR.global_position
	get_parent().add_child(newBullet)
