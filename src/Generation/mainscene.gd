extends Node2D


@onready var timer = $Timer
@onready var spwaner = $Spwaner

@export var scene :PackedScene= null
var last_spwan_position = null
var object_positions = []

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
	last_spwan_position = assign_pos(spwaner.global_position)
	new_scene.global_position = last_spwan_position
	await get_tree().physics_frame
	var overlapping_area = new_scene.get_overlapping_areas()
	spwaner.add_child(
			new_scene
	)
	await get_tree().physics_frame
	overlapping_area = new_scene.get_overlapping_areas()
	object_positions.append(new_scene)
	if len(overlapping_area)>0:
		remove_from_position(object_positions)
		new_scene.queue_free()

func assign_pos(pos)->Vector2:
	randomize()
	
	if len(object_positions)>1:
		var current_position = randf_range(0,get_viewport_rect().size.x)
		while last_spwan_position.distance_to(Vector2(current_position,pos.y)) < 64:
			current_position = randf_range(0,get_viewport_rect().size.x)
		return Vector2(current_position,pos.y)
	else:
		return Vector2(randf_range(0,get_viewport_rect().size.x),pos.y)

func remove_from_position(object):
	object_positions.erase(object)
