extends StaticBody2D

@onready var raycast = $Raycast
@onready var bridgeCollider = $bridgeCollider
@onready var lineVis = $Line2D
@onready var particles = $CPUParticles2D
@export var leftFacing: bool = false

var lineStartPoint = 6

func _ready() -> void:
	if leftFacing:
		$Sprite2D.flip_h = true
		lineStartPoint = -5
		raycast.target_position.x = -1000

func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		lineVis.clear_points()
		lineVis.add_point(Vector2(lineStartPoint,0))
		bridgeCollider.scale.x = to_local(raycast.get_collision_point()).x
		bridgeCollider.position.x = to_local(raycast.get_collision_point()).x / 2
		
		particles.emission_rect_extents.x = to_local(raycast.get_collision_point()).x / 2
		particles.position.x = bridgeCollider.position.x
		
		var newParticleAmount = abs(int(0.5 * to_local(raycast.get_collision_point()).x))
		if newParticleAmount != particles.amount:
			particles.amount = newParticleAmount
		
		lineVis.add_point(Vector2(to_local(raycast.get_collision_point()).x, 0))
