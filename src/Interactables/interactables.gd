extends Area2D
class_name  Interactables
@export var Gravity :int= 300
@onready var Level = get_tree().get_nodes_in_group("Level")[0]
@export var  movable = true




func _physics_process(delta: float) -> void:
	motion_code(delta)
	if movable:
		global_position.y+= Gravity*delta

func motion_code(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	Level.remove_from_position(self)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	on_body_entered()

func on_body_entered():
	pass
