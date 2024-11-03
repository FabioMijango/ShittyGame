extends CharacterBody2D
class_name Enemy

#Enemy`s atributtes
var Healt: int = 5
var cardinal_direction: Vector2 = Vector2.ZERO

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: EnemyStateMachine = $StateMachine
@onready var Nav_Agent: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	print(self.name, "State Machine")
	state_machine.Initialize(self)
	pass

# Not sure if this is needed
# func Set_Direction() -> bool:
# 	var new_dir: Vector2 = cardinal_direction
# 	if direction == Vector2.ZERO:
# 		return false
	
# 	if direction.y == 0:
# 		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
# 	elif direction.x == 0:
# 		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
# 	if new_dir == cardinal_direction:
# 		return false

# 	cardinal_direction = new_dir
# 	Sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	
# 	return true;

# No need to modified
func Update_Animation(state: String) -> void:
	Sprite.play(state + "_" + AnimDirection())
	pass

# No need to modified
func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "front"
	elif cardinal_direction == Vector2.UP:
		return "back"
	else:
		return "side"
