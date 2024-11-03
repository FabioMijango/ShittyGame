extends State_Enemy
class_name e_State_Idle


# When mob enter state
func Enter() -> void:
	enemy.Update_Animation("idle")
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
