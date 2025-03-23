extends StaticBody2D

@onready var raycast = $Raycast
@onready var bridgeCollider = $bridgeCollider
@export var leftFacing: bool = false

func _ready() -> void:
	if leftFacing:
		raycast.target_position.x = -1000

func _process(delta: float) -> void:
	if raycast.is_colliding():
		bridgeCollider.scale.x = to_local(raycast.get_collision_point()).x
		bridgeCollider.position.x = to_local(raycast.get_collision_point()).x / 2
