extends Control

const GAME_SCENE_PATH = "res://world.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.connect("pressed",_on_start_button_pressed)
	$VBoxContainer/ExitButton.connect("pressed", _on_exit_button_pressed)
	
	# Connect button signals to their respective functions
	#$VBoxContainer/StartButton.connect("pressed", self, "_on_start_button_pressed")
	#$VBoxContainer/ExitButton.connect("pressed", self, "_on_exit_button_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function for Start button
func _on_start_button_pressed():
	# Load the main game scene
	get_tree().change_scene_to_file("res://world.tscn")

	#queue_free()

# Function for Exit button
func _on_exit_button_pressed():
	# Quit the game
	get_tree().quit()
