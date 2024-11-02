extends CharacterBody2D

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var action_timer: Timer = $actionTimer

enum STATES {
	IDLE, WALK, ACTION
}

const SPEED: int = 150

var state: int = STATES.IDLE
var Healt: int = 4

var lookingTo: String = "front"

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	# State handling
	state_Transition(direction)
	perform_State_Action(direction)

func state_Transition(direction: Vector2):
	if !isState(STATES.ACTION):
		if direction != Vector2.ZERO:
			state = STATES.WALK
		else:
			state = STATES.IDLE
		
	if Input.is_action_just_pressed("action"):
		state = STATES.ACTION
		action_timer.start()

func isState(STATE: int) -> bool:
	return state == STATE

func perform_State_Action(direction: Vector2):
	
	if !isState(STATES.ACTION):
		movement(direction)
		update_animation(direction)
	elif isState(STATES.ACTION) and !action_timer.is_stopped():
		do_action()


func movement(direction: Vector2) -> void:
	velocity = direction * SPEED

	move_and_slide()

func update_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		Sprite.play("idle_" + lookingTo)
	else:
		if direction.x != 0:
			lookingTo = "side"
			Sprite.flip_h = direction.x < 0
		elif direction.y < 0:
			lookingTo = "back"
		elif direction.y > 0:
			lookingTo = "front"
		Sprite.play("walk_" + lookingTo)

func do_action() -> void:
	Sprite.play("attack_" + lookingTo)
	#TODO add more logic when need

func _on_action_timer_timeout() -> void:
	state = STATES.WALK

func get_healt() -> int:
	return Healt
	
