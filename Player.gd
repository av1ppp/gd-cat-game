extends KinematicBody

const SPEED   = 3
const JUMP    = 5
const GRAVITY = 0.98
const ROTATE = 0.1

onready var anim = $CollisionShape/scene/AnimationPlayer

var y_pos = 0

func _ready():
	anim.get_animation("Root|RootAction").set_loop(true)
	anim.play("Root|RootAction")
	
func _physics_process(delta):
	var moving_vec = Vector3()

	if Input.is_action_pressed("move_forwards"):
		moving_vec.z += 1
	if Input.is_action_pressed("move_backwards"):
		moving_vec.z -= 1
	if Input.is_action_pressed("move_right"):
		rotate_y(-ROTATE)
	if Input.is_action_pressed("move_left"):
		rotate_y(ROTATE)

	moving_vec = moving_vec.normalized()
	moving_vec *= SPEED
	
	move_and_slide(transform.basis.xform(Vector3(0, y_pos, moving_vec.z)))
	
	y_pos -= GRAVITY
	if Input.is_action_pressed("jump"):
		y_pos = JUMP
