class_name  Player extends CharacterBody2D

@export var speed: float = 900.0
@export var acceleration: float = 2000.0
@export var deceleration: float = 3000.0
@export var direction: Vector2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction.length() > 0.0:
		velocity = velocity.move_toward(speed * direction, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()
