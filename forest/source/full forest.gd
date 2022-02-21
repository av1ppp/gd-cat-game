extends Spatial

onready var anim = $RootNode/AnimationPlayer

func _ready():
	anim.get_animation("Take 001").set_loop(true)
	anim.play("Take 001")
