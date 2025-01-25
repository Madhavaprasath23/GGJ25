extends Interactables

var direction = 1
var move_velocity = Vector2()
var speed = 500
var pursuve = false
var start_rotation = 0
var interacted = false
func motion_code(delta):
	if pursuve:
		move_velocity = direction*speed*delta*2
		rotation = move_velocity.angle()
		global_position+=move_velocity

func _on_timer_timeout() -> void:
	pursuve = false


func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player") and !interacted:
		direction = (area.global_position - global_position).normalized()
		pursuve=true
		interacted = true
