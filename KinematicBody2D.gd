extends KinematicBody2D

# Global variables
const UP = Vector2(0, -1)
var motion = Vector2()
export var acceleration = 200
export var jump = 400
export var gravity = 20

# Score label
onready var score_label = get_node("Camera/Score")
# set_text: score_label.set_text("Score: " + str(scoretext))

func _physics_process(delta):
	
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = acceleration
	elif Input.is_action_pressed("ui_left"):
		motion.x = -acceleration
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -jump
	
	motion = move_and_slide(motion, UP)
