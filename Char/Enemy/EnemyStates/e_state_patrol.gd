extends State_Enemy
class_name e_State_Patrol

var new_pos: Vector2

@onready var idle: e_State_Idle = $"../idle"

# When mob enter state
func Enter() -> void:
	enemy.Update_Animation("walk")
	set_New_Pos()
	pass

# When mob exit state
func Exit() -> void:
	pass

# Process while State
func Process(_delta: float) -> State_Enemy:
	return null

# Physics Process while State
func Physics_Process(_delta: float) -> State_Enemy:
	#if Nav_agent
	
	var Cur_Agent_Pos = enemy.global_position
	var NextPath_Pos = Nav_agent.get_next_path_position()
	var new_Velocity = Cur_Agent_Pos.direction_to(NextPath_Pos) * enemy.SPEED
	
	if Nav_agent.is_navigation_finished():
		return idle
	
	if Nav_agent.avoidance_enabled:
		Nav_agent.set_velocity(new_Velocity)
	else:
		#Nav_agent._on_navigation_agent_2d_velocity_computed(new_Velocity)
		enemy.velocity = new_Velocity
	
	enemy.move_and_slide()
	enemy.Sprite.flip_h = enemy.velocity.x < 0
	return null

func set_New_Pos() -> void:
	new_pos = Vector2(RNG.randf_range(enemy.position.x + 150, enemy.position.x -150), RNG.randf_range(enemy.position.y + 150, enemy.position.y -150))
	Nav_agent.target_position = new_pos
	pass
