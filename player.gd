extends CharacterBody2D
var initial_p = Vector2(1.0, 0.0)
var notfloor = 0.0
var gravity = 2000.0
var going_right: bool = false
var has_turned: bool = false
var dashed: bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = e.speed
		going_right = true
		if is_on_floor():
			animated_sprite_2d.play("walk_right")
	elif Input.is_action_pressed("left"):
		velocity.x = -e.speed
		going_right = false
		if is_on_floor():
			animated_sprite_2d.play("walk_left")
	if not is_on_floor():
		velocity.y += gravity * delta
		notfloor += delta
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = e.jump
		if going_right:
			animated_sprite_2d.play("leap_right")
		else:
			animated_sprite_2d.play("leap_left")
	if not is_on_floor() and not is_on_wall():
		if going_right:
			animated_sprite_2d.play("leap_right")
		else:
			animated_sprite_2d.play("leap_left")
		if Input.is_action_pressed("dash"):
			if going_right:
				velocity.x = 4500
			else:
				velocity.x = -4500
	if Input.is_action_pressed("climb") and is_on_wall():
		velocity.y = 0
		if not has_turned:
			if going_right:
				animated_sprite_2d.play("to_wall_right")
			else:
				animated_sprite_2d.play("to_wall_left")
			has_turned = true
		if going_right and has_turned:
			animated_sprite_2d.play("climb_right")
		elif has_turned and not going_right:
			animated_sprite_2d.play("climb_left")
		if Input.is_action_pressed("up"):
			velocity.y = -500
		if Input.is_action_pressed("down"):
			velocity.y = 500
	move_and_slide()
