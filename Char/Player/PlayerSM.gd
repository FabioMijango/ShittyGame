extends Node
class_name PlayerStateMachine

var STATES: Array[ State ]
var prev_State: State
var curr_State: State

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

func _unhandled_input(event: InputEvent) -> void:
	ChangeState(curr_State.HandleInput(event))
	pass

func Initialize(_player: Player) -> void:
	STATES = []
	for c in get_children():
		if c is State:
			STATES.append(c)
	
	if STATES.size() > 0:
		STATES[0].player = _player
		ChangeState(STATES[0])
		process_mode = Node.PROCESS_MODE_INHERIT


func ChangeState(new_State: State) -> void:
	if new_State == null || new_State == curr_State:
		return
	
	if curr_State:
		curr_State.Exit()
	
	prev_State = curr_State
	curr_State = new_State
	curr_State.Enter()
