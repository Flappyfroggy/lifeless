extends CharacterBody2D
var initial_p = Vector2(1.0, 0.0)
var notfloor = 0.0
var gravity = 2000.0
@onready var animated_sprite_2d = $AnimatedSprite2D
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = e.speed
		if is_on_floor():
			animated_sprite_2d.play("walk_right")
	elif Input.is_action_pressed("left"):
		velocity.x = -e.speed
		if is_on_floor():
			animated_sprite_2d.play("walk_left")
	if not is_on_floor():
		velocity.y += gravity * delta
		notfloor += delta
	if is_on_floor():
		notfloor = 0.0
	if notfloor >= 3:
		position = initial_p
		notfloor = 0
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = e.jump
	if Input.is_action_pressed("dash"):
		velocity.x = 4000
	move_and_slide()
