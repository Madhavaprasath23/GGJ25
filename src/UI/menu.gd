extends Panel

@export var title_text: String = ""
@export var play_text: String = "Play"
@export var resume_text: String = "Resume"
var game_paused: bool = false
var credits_shown: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	%CreditsText.visible = false
	%GoBackButton.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#move this Inputs to the main script
	if Input.is_action_just_pressed("ui_menu") && game_paused == false:
		open_menu("paused")
	elif Input.is_action_just_pressed("ui_menu") && game_paused == true && credits_shown == false:
		_on_play_resume_button_pressed()
	elif Input.is_action_just_pressed("ui_menu") && credits_shown == true:
		_close_credits()

func open_menu(state: String) -> void:
	get_tree().paused = true
	%PlayResumeButton.grab_focus()
	if state == "paused":
		%PlayResumeButton.text = resume_text
		game_paused = true
	elif state == "start":
		%PlayResumeButton.text = play_text
	%TitleLabel.text = title_text
	visible = true
	credits_shown = false
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _show_credits() -> void:
	# Making buttons invisible when credit is shown
	credits_shown = true
	for child in %VBoxContainer.get_children():
		if child is Button:
			child.visible = false
	%TitleLabel.text = "Credits"
	%CreditsText.visible = true
	%GoBackButton.visible = true
	%GoBackButton.grab_focus()


func _on_play_resume_button_pressed() -> void:
	self.visible = false
	get_tree().paused = false
	if game_paused:
		game_paused = not game_paused


func _close_credits() -> void:
	for child in %VBoxContainer.get_children():
		if child is Button:
			child.visible = true
	%GoBackButton.visible = false
	%TitleLabel.text = title_text
	%CreditsText.visible = false
	%PlayResumeButton.grab_focus()
	credits_shown = false
