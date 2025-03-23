extends CharacterBody2D

@onready var player_animator: AnimationPlayer = $PlayerAnimator
@onready var player_sprite: Sprite2D = $PlayerSprite

const SPEED = 50.0
var jump_height = -200.0


func _physics_process(delta: float) -> void:
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
		velocity.y = jump_height
		
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
			real_grav /= 6
		velocity += real_grav * delta



	move_and_slide()
