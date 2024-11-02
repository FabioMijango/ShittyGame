extends Node

var Healt: Array = []
var heart: PackedScene = preload("res://GUI/Heart.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	# Creation of hearts to be drawed in screen
	#for i in get_parent().get_healt():
		#var heart_instance = heart.instantiate()
		#heart_instance.position = Vector2( i*11 +5, 5)
		#Healt.append(heart_instance)
		#add_child(heart_instance)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
