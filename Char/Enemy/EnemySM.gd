extends Node
class_name EnemyStateMachine

var STATES: Array[ State_Enemy ]
var prev_State: State_Enemy
var curr_State: State_Enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ChangeState(curr_State.Process(delta))
	pass

func _physics_process(delta: float) -> void:
	ChangeState(curr_State.Physics_Process(delta))
	pass



func Initialize(_enemy: Enemy) -> void:
	STATES = []
	for c in get_children():
		if c is State_Enemy:
			print("State added , enemy")
			STATES.append(c)
	
	if STATES.size() > 0:
		STATES[0].enemy = _enemy
		ChangeState(STATES[0])
		process_mode = Node.PROCESS_MODE_INHERIT


func ChangeState(new_State: State_Enemy) -> void:
	if new_State == null || new_State == curr_State:
		return
	
	if curr_State:
		curr_State.Exit()
	
	prev_State = curr_State
	curr_State = new_State
	# Sending the Nav_Agent... Maybe not the best way....
	curr_State.setNav_Agent(get_parent().Nav_Agent)
	curr_State.Enter()
