extends State
class_name State_Walk

const  SPEED: int = 150

@onready var idle: State_Idle = $"../idle"

# When player enter state
func Enter() -> void:
	player.Update_Animation("walk")
	pass

# When player exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * SPEED
	if player.Set_Direction():
		player.Update_Animation("walk")
	
	player.move_and_slide()
	
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State:
	return null

# Input in this State
func HandleInput(_event: InputEvent) -> State:
	return null
