extends Node2D


var target_moving_speed = 64
var steering = Vector2()
var velocity = Vector2()
var max_force = 100
@onready var target = Vector2(randf_range(600,1200),randf_range(700+64,800+64))
var spwan_position = null
func _ready() -> void:
	randomize()
	print(target)
func _physics_process(delta: float) -> void:
	velocity = (target - position).normalized() * 100
	var desired_velocity = (target - position).normalized() * 100

	steering = desired_velocity - velocity
	steering = steering.limit_length(max_force)
	steering = steering / 10
	velocity = (velocity + steering).limit_length(max_force)

	position += (velocity * delta) + (Vector2(0,10)*delta)
