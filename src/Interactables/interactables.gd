extends Area2D

@export var Gravity :int= 10
@onready var Level = get_tree().get_nodes_in_group("Level")[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


	

func _physics_process(delta: float) -> void:
	global_position.y+= Gravity*delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	Level.remove_from_position(self)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	pass # Replace with function body.
