extends CharacterBody2D
var initial_p = Vector2(30, 10)
var notfloor = 0.0
var gravity = 2400.0
var going_right: bool = false
var has_turned: bool = false
var can_dash: bool = false
var timer_started: bool = false

@onready var dash_cd = $dash_cooldown
@onready var animated_sprite_2d = $AnimatedSprite2D
func _ready():
	dash_cd.timeout.connect(timeout)
func _physics_process(delta):
	if not can_dash and not timer_started:
		dash_cd.start()
		timer_started = true
	velocity.x = 0
	if position.y > 3000:
		position = initial_p
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
		if Input.is_action_just_pressed("dash") and not Input.is_action_pressed("up") and can_dash:
			if going_right:
				velocity.x = 40000
				can_dash = false
			elif not going_right:
				velocity.x = -40000
				can_dash = false
		if Input.is_action_just_pressed("dash") and Input.is_action_pressed("up") and can_dash:
			velocity.y = -1000
			can_dash = false
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
	if e.playertouchedspikes:
		position = initial_p
		e.playertouchedspikes = false
	move_and_slide()


func timeout():
	can_dash = true
	timer_started = false
