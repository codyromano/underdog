extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_facing_left = false;

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_just_pressed("move_left"):
		is_facing_left = true
	elif Input.is_action_just_pressed("move_right"):
		is_facing_left = false
	
	$HumanAnimatedSprite2D.flip_h = is_facing_left
	$HumanAnimatedSprite2D.play("run" if direction else "idle")
	
	if Input.is_action_just_pressed("move_up"):
		velocity.y += JUMP_VELOCITY
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
