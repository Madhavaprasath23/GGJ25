extends Interactables

var direction = 1
var move_velocity = Vector2()
var speed = 500
var pursuve = false

func motion_code(delta):
	if pursuve:
		move_velocity = direction*speed*delta
		global_position+=move_velocity
	else:
		move_velocity = Vector2(direction,Gravity)*speed*delta
		global_position+=move_velocity
	print(global_position)

func _on_timer_timeout() -> void:
	pursuve = false
