extends VehicleBody

var acceleration = 5;
var force = 0;
var limiteRotation = 0;

func _physics_process(delta):	
	steering = Input.get_axis("right", "left") * .4;
	engine_force = Input.get_axis("back","forward") * 100;
	
	$ArmJoint.rotate_x(Input.get_axis("negativeRotation","positiveRotation")/(2*PI));
	$ArmJoint.rotation_degrees.x = clamp($ArmJoint.rotation_degrees.x, -30, 15);
	
	
	

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
