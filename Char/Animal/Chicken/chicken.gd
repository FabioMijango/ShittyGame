extends CharacterBody2D

@onready var timer: Timer = $Timer
@onready var Nav_Agent: NavigationAgent2D = $NavigationAgent2D
@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60.0

var rng = RandomNumberGenerator.new()
var new_pos: Vector2 = Vector2.ZERO

func _ready() -> void:
	new_pos = Vector2(rng.randf_range(position.x + 150, position.x -150), rng.randf_range(position.y + 150, position.y -150))
	Nav_Agent.target_position = new_pos

func _physics_process(_delta: float) -> void:
	Sprite.play("idle")
	
	var Cur_Agent_Pos = global_position
	var NextPath_Pos = Nav_Agent.get_next_path_position()
	var new_Velocity = Cur_Agent_Pos.direction_to(NextPath_Pos) * SPEED
	
	if Nav_Agent.is_navigation_finished():
		return
	
	if Nav_Agent.avoidance_enabled:
		Nav_Agent.set_velocity(new_Velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_Velocity)
	
	Sprite.play("walk")
	Sprite.flip_h = velocity.x > 0
	
	move_and_slide()


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity

func _on_timer_timeout() -> void:
	new_pos = Vector2(rng.randf_range(position.x + 150, position.x -150), rng.randf_range(position.y + 150, position.y -150))
	Nav_Agent.target_position = new_pos
