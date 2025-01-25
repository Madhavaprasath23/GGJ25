extends Interactables

const GRAVITY = 500
const DAMAGE = 2

var velocity = Vector2.ZERO
var original_rotation = 0.0

@onready var screen_size = get_viewport_rect().size
var speed_factor = randi_range(3,5)
func _ready() -> void:
	launch(get_global_mouse_position())

func motion_code(delta):
	
	velocity.y+=GRAVITY*delta * speed_factor
	$Sprite2D.rotation = original_rotation + velocity.angle()
	global_position += Vector2(velocity.x*delta,velocity.y*delta) * speed_factor
	print(global_position)
func calculate_arc_velocity(source_position, target_position, arc_height, gravity):
	var velocity = Vector2()
	var displacement = target_position - source_position
	
	if displacement.y > arc_height:
		var time_up = sqrt(-2 * arc_height / float(gravity))
		var time_down = sqrt(2 * (displacement.y - arc_height) / float(gravity))
		print("time %s" % (time_up + time_down))
		
		velocity.y = -sqrt(-2 * gravity * arc_height)
		velocity.x = displacement.x / float(time_up + time_down) 
	
	return velocity
	
func launch(target_position):
	var direction = (target_position - position).normalized()
	if direction.x < 0: # left
		pass
	original_rotation = $Sprite2D.rotation
	
	# calculate arc_height based on distance
	var distance = abs(target_position.x - global_position.x)
	var max_height = (distance / screen_size.x) * screen_size.y * 0.4
	
	var arc_height = target_position.y - global_position.y - max_height
	arc_height = min(arc_height, -max_height)
	print("height %s" % arc_height)
	
	velocity = calculate_arc_velocity(global_position, target_position, arc_height, GRAVITY)
