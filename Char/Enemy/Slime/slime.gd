extends Enemy
class_name Slime

func _ready() -> void:
	print(self.name, "State Machine")
	state_machine.Initialize(self)
	
	
	Nav_Agent.path_postprocessing = NavigationPathQueryParameters2D.PATH_POSTPROCESSING_EDGECENTERED
	pass

func Update_Animation(state: String) -> void:
	Sprite.play(state)
	pass
