extends VehicleBody

const MAX_ENGINE_FORCE = 500;
const MAX_RPM = 500;
const ARM_TORQUE = 5;

var force;
var rpm;
var angle;
var maxAngle;


func movement(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * .4, 5 * delta);
	
	rpm = $LeftWheel.get_rpm();
	force = Input.get_axis("back","forward") * MAX_ENGINE_FORCE;
	engine_force = force * (1 - rpm/MAX_RPM);
	

func arms(delta):
	angle = $ArmJoint.rotation_degrees.x;
	maxAngle = Input.get_axis("negativeRotation","positiveRotation") * 30 - 10;
	angle = lerp(angle, maxAngle, ARM_TORQUE * delta);
	$ArmJoint.rotation_degrees.x = angle;


func balance(delta):
	var vector_to = Vector3.UP;
	var global_up_vector = to_global(translation + vector_to) - to_global(translation);
	var align_axis = global_up_vector.cross(rotation);
	angular_velocity = align_axis * 4;


func _physics_process(delta):
	movement(delta);
	arms(delta);
	balance(delta);
	

func _ready():
	brake = 2;
