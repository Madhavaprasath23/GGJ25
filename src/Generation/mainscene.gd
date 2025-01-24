extends Node2D


@onready var timer = $Timer
@onready var spwaner = $Spwaner

@export var scene :PackedScene= null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_viewport_rect().size)
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	create_child()
	pass

func create_child():
	var new_scene = scene.instantiate()
	new_scene.global_position = assign_pos(spwaner.global_position)
	spwaner.add_child(
		new_scene
	)

func assign_pos(pos)->Vector2:
	randomize()
	var vec_x = randf_range(0,get_viewport_rect().size.x)
	return Vector2(vec_x,pos.y)
