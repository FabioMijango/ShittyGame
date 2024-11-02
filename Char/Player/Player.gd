extends CharacterBody2D

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var action_timer: Timer = $actionTimer

const SPEED = 150.0

var Healt: int = 7

var direction: Vector2
var lookingTo: String = "front"
var doing_action: bool = false

func _physics_process(_delta: float) -> void:
	
	direction = Input.get_vector("left", "right", "up", "down")
	
	# Update sprites
	if !doing_action:
		movement()
		update_animation()
	if Input.is_action_just_pressed("action"):
		do_action()

func movement() -> void:
   # Verify if there's movement in X
	if direction.x != 0:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0

	# Verify if there's movement in Y
	if direction.y != 0:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = 0

	move_and_slide()

func update_animation() -> void:
	# Verify if the player is moving in any direction
	if direction == Vector2.ZERO:
		Sprite.play("idle_" + lookingTo)
	# Verify if the player is moving in X
	elif direction.x != 0:
		lookingTo = "side"
		Sprite.play("walk_side")
		Sprite.flip_h = direction.x < 0
	# Verify if the player is moving in Y
	elif direction.y < 0:
		lookingTo = "back"
		Sprite.play("walk_back")
	elif direction.y > 0:
		lookingTo = "front"
		Sprite.play("walk_front")

func do_action() -> void:
	doing_action = true
	Sprite.play("attack_" + lookingTo)
	action_timer.start()

func _on_action_timer_timeout() -> void:
	doing_action = false

func get_healt() -> int:
	return Healt
	
