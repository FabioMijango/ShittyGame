extends Node
class_name State_Enemy

# TODO be determined soon...
static var enemy: Enemy

var Nav_agent: NavigationAgent2D
var RNG = RandomNumberGenerator.new()

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

func setNav_Agent(_Nav_Agent: NavigationAgent2D)-> void:
		self.Nav_agent = _Nav_Agent
		pass
