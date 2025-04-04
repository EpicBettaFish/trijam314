extends CharacterBody2D

@onready var player_animator: AnimationPlayer = $PlayerAnimator
@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var dialogue = $Dialogue

const SPEED = 50.0
var jump = -125.0
var push_force = 10.0
@onready var size_checker: RayCast2D = $SizeChecker

@onready var foot_sounds = [load("res://assets/audio/footstep.mp3"), load("res://assets/audio/jump_start.mp3"), load("res://assets/audio/jump_land.mp3")]

var footstep_sound = false


func _physics_process(delta: float) -> void:
	var was_airborne = false
	if !is_on_floor():
		was_airborne = true
	# settings jump height setter
	match Singleton.jump_height:
		0.0:
			jump = -80.0
		1.0:
			jump = -125.0
		2.0:
			jump = -200.0
			
	match Singleton.player_size:
		0.0:
			scale = Vector2(.5,.5)
		1.0:
			scale = Vector2(1,1)
		2.0:
			scale = Vector2(2,2)
			
		
	if size_checker.is_colliding():
		# *****TEMPORARY***** should set to last checkpoint
		get_parent().die()

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
		footstep_sound = true
		$Feet.stream = foot_sounds[1]
		$Feet.play()
		velocity.y = jump
		
	# player animations
	if is_on_floor():
		if direction:
			player_animator.play("walk")
			if !footstep_sound:
				footstep_sound = true
				$Feet.stream = foot_sounds[0]
				$Feet.play()
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
	
	if is_on_floor() and was_airborne:
		footstep_sound = true
		$Feet.stream = foot_sounds[2]
		$Feet.play()
	
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			print(-c.get_normal())
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)


func _on_feet_finished() -> void:
	footstep_sound = false
