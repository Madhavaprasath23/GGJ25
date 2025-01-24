class_name  Player extends CharacterBody2D

@export var speed: float = 900.0
@export var direction: Vector2
@export var movement_weight: float = 20.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction.length() > 0.0:
		velocity = lerp(velocity, speed * direction, movement_weight * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, movement_weight / 2 * delta)
	
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
