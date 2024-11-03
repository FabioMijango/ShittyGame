extends Node

var Healt: Array = []
var heart: PackedScene = preload("res://GUI/Heart.tscn")

var player: Player

# Called when the node enters the scene tre#e for the first time.
func _ready() -> void:
	player = get_parent()
	 #Creation of hearts to be drawed in screen
	for i in player.Healt:
		var heart_instance = heart.instantiate()
		heart_instance.position = Vector2( i*11 +5, 5)
		Healt.append(heart_instance)
		add_child(heart_instance)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Called when window size es changed
func change_Location(window_size: Vector2, ratio: float) -> void:
	self.position = -Vector2(window_size.x / ratio, window_size.y / ratio - 1)
