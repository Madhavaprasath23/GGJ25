extends Node2D


var target_moving_speed = 64
var steering = Vector2()
var velocity = Vector2()
var max_force = 500
var target = Vector2(randf_range(600,1200),randf_range(700+64,800+64))
func _ready() -> void:
	randomize()
	target = Vector2(randf_range(600,1200),randf_range(700+64,800+64))
	print(target)
func _physics_process(delta: float) -> void:
	velocity = (target - position).normalized() * 700
	var desired_velocity = (target - position).normalized() * 700

	steering = desired_velocity - velocity
	steering = steering.limit_length(max_force)
	steering = steering / 10
	velocity = (velocity + steering).limit_length(max_force)

	position += (velocity * delta) + (Vector2(0,10)*delta)
