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
		direction = ROTATION_SPEED * Vector2(1,-1);
		if force == 0:
			add_torque(Vector3(0,10000,0))
	elif(Input.get_axis("right", "left") < -.5):
		direction = ROTATION_SPEED * Vector2(-1,1);
		if force == 0:
			add_torque(Vector3(0,-10000,0))
	else:
		direction = Vector2.ONE;
		
	rpm = $LeftWheel.get_rpm();
	force = Input.get_axis("back","forward") * MAX_ENGINE_FORCE;
	
	$LeftWheel.engine_force = force * (1 - rpm/MAX_RPM) * direction[0];
	$RightWheel.engine_force = force * (1 - rpm/MAX_RPM) * direction[1];
	


func balance(delta):
	var vector_to = Vector3.UP;
	var global_up_vector = to_global(translation + vector_to) - to_global(translation);
	var align_axis = global_up_vector.cross(vector_to);
	
	var _temp = lerp(angular_velocity, align_axis, 5*delta);
	angular_velocity.x = _temp.x
	angular_velocity.z = _temp.z


func _physics_process(delta):
	movement(delta);
	balance(delta);
	if force != 0 or Input.get_axis("right", "left") != 0:
		$Audio_Player/motor.playing = true
	else:
		$Audio_Player/motor.playing = false


func _ready():
	brake = 2;
	
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
