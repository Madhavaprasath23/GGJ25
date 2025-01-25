class_name PickUps extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Remove or comment out the draw function upon adding assets
func _draw() -> void:
	draw_circle(Vector2.ZERO, 30.0, Color.LIGHT_CORAL, true, -1.0, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.active_layers < body.max_layers:
			body.set_active_layers(body.active_layers + 1)
			self.queue_free()
