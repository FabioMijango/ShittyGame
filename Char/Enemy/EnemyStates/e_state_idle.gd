extends State_Enemy
class_name e_State_Idle

var TimeInit: int

@onready var patrol: e_State_Patrol = $"../patrol"

# When mob enter state
func Enter() -> void:
	enemy.Update_Animation("idle")
	TimeInit = Time.get_ticks_msec()
	pass

# When mob exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State_Enemy:
	if Time.get_ticks_msec() - TimeInit > 5000:
		if RNG.randf() > 0.99:
			return patrol
		pass
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State_Enemy:
	return null
