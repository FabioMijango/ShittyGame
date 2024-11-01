extends CharacterBody2D

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0

var direction: Vector2
var lookingTo: String = "front"

func _physics_process(_delta: float) -> void:
	
	direction = Input.get_vector("left", "right", "up", "down")
	
	movement()
	update_animation()
	

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
