extends Node
class_name State

static var player: Player

# When player enter state
func Enter() -> void:
	pass

# When player exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State:
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State:
	return null

# Input in this State
func HandleInput(_event: InputEvent) -> State:
	return null
