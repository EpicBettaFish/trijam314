extends StaticBody2D

@onready var raycast = $Raycast
@onready var bridgeCollider = $bridgeCollider
@onready var lineVis = $Line2D
@export var leftFacing: bool = false

var lineStartPoint = 6

func _ready() -> void:
	if leftFacing:
		$Sprite2D.flip_h = true
		lineStartPoint = -6
		raycast.target_position.x = -1000

func _process(delta: float) -> void:
	if raycast.is_colliding():
		lineVis.clear_points()
		lineVis.add_point(Vector2(lineStartPoint,0))
		bridgeCollider.scale.x = to_local(raycast.get_collision_point()).x
		bridgeCollider.position.x = to_local(raycast.get_collision_point()).x / 2
		lineVis.add_point(Vector2(to_local(raycast.get_collision_point()).x, 0))
