class_name  Player extends CharacterBody2D

@export var speed: float = 900.0
@export var direction: Vector2
@export var movement_weight: float = 20.0

const BUBBLE_LAYER = preload("res://src/Player/bubble_layer.tscn")
@export var max_layers: int = 2 : set = set_max_layers
@export var active_layers: int = 0 : set = set_active_layers

func _ready() -> void:
<<<<<<< Updated upstream
	print(get_viewport_rect().size)
	pass
=======
	set_max_layers(max_layers)
	set_active_layers(active_layers)
>>>>>>> Stashed changes

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction.length() > 0.0:
		velocity = lerp(velocity, speed * direction, movement_weight * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, movement_weight / 2 * delta)
	
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)


func set_max_layers(new_amount: int) -> void:
	max_layers = new_amount

func set_active_layers(new_amount: int) -> void:
	active_layers = clampi(new_amount, 0, max_layers)
	
	for child in get_children():
		if child is BubbleLayer:
			child.queue_free()
	
	for layers in active_layers:
		var bubble_layer := BUBBLE_LAYER.instantiate()
		bubble_layer.radius += layers * 6
		add_child(bubble_layer)
