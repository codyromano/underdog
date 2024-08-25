extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	$HumanAnimatedSprite2D.flip_h = Input.is_action_pressed("move_left")
		
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		$HumanAnimatedSprite2D.play("run_right")
	else:
		$HumanAnimatedSprite2D.play("idle")
		
	## TODO: Add gravity here if you want it
	# Add the gravity.
	# if not is_on_floor():
		# velocity.y = velocity.y
		# velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
