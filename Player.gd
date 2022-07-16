extends VehicleBody

const MAX_ENGINE_FORCE = 500;
const MAX_RPM = 500;
const ARM_TORQUE = 5;
const ROTATION_SPEED = 10;

var force;
var rpm;
var angle;
var maxAngle;
var direction = Vector2.ONE;


func movement(delta):
	if(Input.get_axis("right", "left") > .5):
		direction = ROTATION_SPEED * Vector2(-1,1);
	elif(Input.get_axis("right", "left") < -.5):
		direction = ROTATION_SPEED * Vector2(1,-1);
	else:
		direction = Vector2.ONE;
		
	rpm = $LeftWheel.get_rpm();
	force = Input.get_axis("back","forward") * MAX_ENGINE_FORCE;
	
	$LeftWheel.engine_force = force * (1 - rpm/MAX_RPM) * direction[0];
	$RightWheel.engine_force = force * (1 - rpm/MAX_RPM) * direction[1];
	

func arms(delta):
	angle = $ArmJoint.rotation_degrees.x;
	maxAngle = Input.get_axis("negativeRotation","positiveRotation") * 30 - 10;
	angle = lerp(angle, maxAngle, ARM_TORQUE * delta);
	$ArmJoint.rotation_degrees.x = angle;


func balance(delta):
	var vector_to = Vector3.UP;
	var global_up_vector = to_global(translation + vector_to) - to_global(translation);
	var align_axis = global_up_vector.cross(vector_to);
	
	var _temp = lerp(angular_velocity, align_axis, 5*delta);
	angular_velocity.x = _temp.x
	angular_velocity.z = _temp.z


func _physics_process(delta):
	movement(delta);
	arms(delta);
	balance(delta);


func _ready():
	brake = 2;
