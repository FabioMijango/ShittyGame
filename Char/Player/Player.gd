extends CharacterBody2D
class_name Player

#Player`s atributtes
var direction: Vector2 = Vector2.ZERO
var cardinal_direction: Vector2 = Vector2.ZERO
var Healt: int = 5

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var Healt_Bar: Node = $Healt_Bar

func _ready() -> void:
	state_machine.Initialize(self)
	
	# For case when windows get resized
	get_viewport().connect("size_changed", _on_viewport_resize)

func _process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	pass

func Set_Direction() -> bool:
	var new_dir: Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false

	cardinal_direction = new_dir
	Sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	
	return true;

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


# Signal`s function when window is resized
func _on_viewport_resize():
	var ratio: float = 8.228571428571429
	var window_size: Vector2 = get_viewport().get_visible_rect().size
	
	Healt_Bar.change_Location(window_size, ratio)
	pass
