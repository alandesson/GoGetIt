extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var rot_speed = 20
var actual_speed = rot_speed
export var pendulate = false

onready var initial_rotation = rotation
var rot_dir = 1
export(int, 10, 180) var max_angle = 90

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):	
	
	rotate(to_global(Vector3.UP) - translation, (0.01 * actual_speed * rot_dir)/(2*PI))
	var angle = rotation.distance_to(initial_rotation)
	if angle >= deg2rad(max_angle) :
		rot_dir = rot_dir * -1
	
	if pendulate:
		actual_speed = rot_speed * (1 - angle/deg2rad(max_angle+5))
	
	move_and_slide(Vector3.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
