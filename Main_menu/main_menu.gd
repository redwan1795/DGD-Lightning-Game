#class_name MainMenu
#extends Control
##
#@onready var start_button = $"MarginContainer/HBoxContainer/VBoxContainer/Start Game" as Button
#@onready var exit_button = $"MarginContainer/HBoxContainer/VBoxContainer/Exit" as Button
#@onready var start_level = preload("res://world.tscn") as PackedScene
##
#func _ready():
	### Correct connection using Callable for the signal handlers
	#start_button.connect("pressed", Callable(self, "_on_start_pressed"))
	#exit_button.connect("pressed", Callable(self, "_on_exit_pressed"))
##
#func _on_start_pressed() -> void:
	#if start_level == null:
		#print("Error: start_level could not be loaded. Check the scene path.")
	#else:
		#print("Start Level Loaded: ", start_level)
		##get_tree().change_scene_to_packed(start_level)
		#get_tree().change_scene_to_packed(start_level)
#
#func _on_exit_pressed() -> void:
	#get_tree().quit()
	#
	
#extends Control
#
#const GAME_SCENE_PATH = "res://world.tscn"
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#$VBoxContainer/StartButton.connect("pressed",_on_start_button_pressed)
	#$VBoxContainer/ExitButton.connect("pressed", _on_exit_button_pressed)
	#
	## Connect button signals to their respective functions
	##$VBoxContainer/StartButton.connect("pressed", self, "_on_start_button_pressed")
	##$VBoxContainer/ExitButton.connect("pressed", self, "_on_exit_button_pressed")
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
## Function for Start button
#func _on_start_button_pressed():
	## Load the main game scene
	#get_tree().change_scene_to_file(GAME_SCENE_PATH)
#
## Function for Exit button
#func _on_exit_button_pressed():
	## Quit the game
	#get_tree().quit()
#
	#
	#
