extends VehicleBody

const MAX_ENGINE_FORCE = 400;

var acceleration = 5;
var force = 0;
var limiteRotation = 0;

func _physics_process(delta):	
	steering = Input.get_axis("right", "left") * .4;
	force = Input.get_axis("back","forward") * MAX_ENGINE_FORCE;
	engine_force = force;
	
	$ArmJoint.rotate_x(Input.get_axis("negativeRotation","positiveRotation")/(2*PI));
	$ArmJoint.rotation_degrees.x = clamp($ArmJoint.rotation_degrees.x, -30, 15);
	pass
	
	

func _ready():
	brake = 2;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
