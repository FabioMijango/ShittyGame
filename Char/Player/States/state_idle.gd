extends State
class_name State_Idle

@onready var walk: Node = $"../walk"
@onready var action: State_Action = $"../action"

# When player enter state
func Enter() -> void:
	player.Update_Animation("idle")
	pass

# When player exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State:
	if Input.is_action_just_pressed("action"):
		return action
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State:
	return null

# Input in this State
func HandleInput(_event: InputEvent) -> State:
	return null
