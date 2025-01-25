extends Node2D

var leaf_texture_array := [preload("res://src/assets/leaf 1.png"),preload("res://src/assets/leaf 2.png")]

var target_moving_speed = 64
var steering = Vector2()
var velocity = Vector2()
var max_force = 200
@onready var target = Vector2()
var spwan_position = null
var direction = Vector2()
func _ready() -> void:
	$Sprite2D.texture = leaf_texture_array.pick_random()
	randomize()
	target=get_global_mouse_position()
	direction = (target - position).normalized()
	if direction.x<0:
		scale.x*=-1
func _physics_process(delta: float) -> void:
	global_position += (direction*max_force * delta) + (Vector2(0,10)*delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	await get_tree().physics_frame
	queue_free()
