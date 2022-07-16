extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bouncer_body_entered(body):
	if body is RigidBody:
		var reflexion_axis = to_global(Vector3.UP) - translation
		body.linear_velocity = body.linear_velocity - 2 * (body.linear_velocity.dot(reflexion_axis)) * reflexion_axis
