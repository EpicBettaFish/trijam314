extends CharacterBody2D

@onready var player_animator: AnimationPlayer = $PlayerAnimator
@onready var player_sprite: Sprite2D = $PlayerSprite

const SPEED = 50.0
var jump = -125.0
var push_force = 10.0
@onready var size_checker: RayCast2D = $SizeChecker


func _physics_process(delta: float) -> void:
	# settings jump height setter
	if Singleton.jump_height == 0:
		jump = -62.5
	elif Singleton.jump_height == 1:
		jump = -125.0
	else:
		jump = -200
		
	if Singleton.player_size == 0:
		scale = Vector2(.5,.5)
	elif Singleton.player_size == 1:
		scale = Vector2(1,1)
	else:
		scale = Vector2(2,2)
		
	print(size_checker.is_colliding())
	# player controls
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction == -1:
			player_sprite.flip_h = 1
		elif direction == 1:
			player_sprite.flip_h = 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump
		
	# player animations
	if is_on_floor():
		if direction:
			player_animator.play("walk")
		else:
			player_animator.play("idle")
	else:
		if velocity.y > 0:
			player_animator.play("jump descend")
		elif velocity.y < 0:
			player_animator.play("jump ascend")

		var real_grav = get_gravity()
		if abs(velocity.y) < 30:
			real_grav /= 2
		velocity += real_grav * delta

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
