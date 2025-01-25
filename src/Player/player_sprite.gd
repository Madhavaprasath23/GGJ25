@tool
extends Sprite2D


@export var radius: float = 40.0
@export var color: Color = Color.AQUA
@export var width: float = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Engine.is_editor_hint():
		return
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color, false, width, true)
	pass
