extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var strength = 10
export(String, "right", "left", "forward", "back", "up", "down") var direction = "right"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var dir_vector = Vector3.ZERO
	match direction:
		"right":
			dir_vector = Vector3.RIGHT
		"left":
			dir_vector = Vector3.LEFT
		"forward":
			dir_vector = Vector3.FORWARD
		"back":
			dir_vector = Vector3.BACK
		"up":
			dir_vector = Vector3.UP
		"down":
			dir_vector = Vector3.DOWN
	
	if get_overlapping_bodies().size() > 0:
		for body in get_overlapping_bodies():
			if body.get_class() == "RigidBody":
				body.add_central_force((to_global(dir_vector) - to_global(Vector3.ZERO)).normalized() * strength * 1.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
