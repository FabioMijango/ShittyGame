extends Node
class_name State_Enemy

# TODO be determined soon...
static var enemy: Enemy

# When mob enter state
func Enter() -> void:
	pass

# When mob exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State_Enemy:
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State_Enemy:
	return null
