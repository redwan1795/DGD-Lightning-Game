extends CharacterBody3D
##
## Simple left/right character controller
##
signal killed

## Speed of character movement
const SPEED = 5.0

#Variables for Jumping: https://forum.godotengine.org/t/how-to-program-the-ability-to-jump-in-4-0-2-in-3d/1997/2
const gravity = -5
const jump_speed = 50
const fall_speed = 3
const floor_normal = Vector3(0, 1, 0)
const floor_y = 1
var is_grounded = true
var jump_count = 0

#var score = 0.0
var score_multiplier = 100
var elapsed_time = 0.0
var is_running = false
var counter = 0



var score_label : Label 
var win_label : Label
var quit_button : Button




func _physics_process(_delta: float) -> void:
	#win_label.visible = false
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit() 

	#IF we're at the floor - ground the player
	if velocity.y == floor_y :
		is_grounded = true

	var curr_pos = clampf(global_position.x, -50, 50)
	if curr_pos < -10 || curr_pos > 10:
		velocity.y -= -50
		is_grounded = false
		win_label.text = "You Lose!! Try again"
		quit_button.visible = true
		counter = 0
		get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")
	if is_grounded:
		#IF we're grounded - make sure we are
		velocity.y = move_toward(velocity.y, 0, jump_speed)
		jump_count -= 1
	else:
		#Not grounded - let us FALL
		velocity.y -= fall_speed
	#Set velocity.y
	velocity.y += gravity * _delta

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# We'll ignore up and down input, just using side to side
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	var collision = get_last_slide_collision()
	if collision:
		_check_y_axis()
		#If collision is at y.0 -> we are at the floor..
		var collPos = collision.get_position()
		if (collPos.y > 0):
			#collided higher - quit
			#Use signal killed to call and end scene or restart?d
			#killed.emit()
			print("Collided with: ", collision.get_collider())
			#get_tree().quit()
			win_label.visible = true
			win_label.text = "You Lose!! Try again"
			quit_button.visible = true
			counter = 0
			get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")
		
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and jump_count < 2:
		velocity.y = jump_speed
		jump_count += 1
		is_grounded = false

func _check_y_axis():
		# If the collision happened at the floor - reset to floor
		
	if velocity.y < 0:
		velocity.y = -50
	elif velocity.y == 0:
#	if velocity.y <= 0:
		velocity.y = 0
		is_grounded = true
		jump_count -= 1

	pass

func _process(delta):
	
	counter += 1
	
	
	
	score_label = $"../Control/Label"
	win_label = $"../Control2/Win"
	quit_button = $"../Control/RestartButton"
	
	#win_label.visible = false
	#quit_button.visible = false
	#print(counter)
	if score_label:
		score_label.text = "Point: "+str(counter)
		if counter > 2000:
			win_label.visible = true
			win_label.text = "Level Completed !!!!!!!!!!"
			#quit_button.visible = true
			counter = 0


func _on_restart_button_pressed() -> void:
	get_tree().quit()
