extends State
class_name State_Action

@onready var walk: Node = $"../walk"
@onready var idle: State_Idle = $"../idle"

var TimeInit: int

# When player enter state
func Enter() -> void:
	player.Update_Animation("attack")
	TimeInit = Time.get_ticks_msec()
	pass

# When player exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State:
	if Time.get_ticks_msec() - TimeInit > 500:
		if player.direction != Vector2.ZERO:
			return walk
		return idle
		
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State:
	return null

# Input in this State
func HandleInput(_event: InputEvent) -> State:
	
	return null
