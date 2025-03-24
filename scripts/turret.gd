extends StaticBody2D

@onready var bulletDir = $BULLETDIR
@export var shootingInterval = 0.2
var realShootingInterval


var bulletScene = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	realShootingInterval = shootingInterval
	timerLoop()


func timerLoop() -> void:
	match Singleton.machine_speed:
		0.0:
			realShootingInterval = shootingInterval * 30
		1.0:
			realShootingInterval = shootingInterval
		2.0:
			realShootingInterval = shootingInterval / 5
	await get_tree().create_timer(realShootingInterval).timeout
	
	shoot()
	timerLoop()

func shoot() -> void:
	var newBullet = bulletScene.instantiate()
	newBullet.global_rotation = bulletDir.global_rotation
	newBullet.myTurret = self
	newBullet.global_position = $BULLETDIR.global_position
	get_parent().add_child(newBullet)
