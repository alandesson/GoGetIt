extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var rot_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	rotate_y((0.01 * rot_speed)/(2*PI))
	move_and_slide(Vector3.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
