extends RigidBody

var numberFaces

func _ready():
	numberFaces = name.trim_prefix("D").to_int()
	Awake(numberFaces)
	print(numberFaces)
	pass

var direction = []
var values = []

func Awake(numerFaces):
	if numerFaces==6:
		if direction.size() == 0:
			direction.append(Vector3.UP)
			values.append(2);
			direction.append(Vector3.DOWN);
			values.append(5); 
 
			direction.append(Vector3.LEFT);
			values.append(3); 
			direction.append(Vector3.RIGHT);
			values.append(4);
 
			direction.append(Vector3.FORWARD);
			values.append(6); 
			direction.append(Vector3.BACK);
			values.append(1);

var vectorUPglobal = (Vector3.UP)

func getNumber(numberFaces):
	var minDifference = 180.0
	var mostSimilarDirectionIndex = -1
	for i in range(0,direction.size()):
		var a = rad2deg(vectorUPglobal.angle_to(to_global(direction[i])-translation))
		print(a)
		if a <= 30.0 and a <= minDifference :
			minDifference = a
			mostSimilarDirectionIndex = i
	return values[mostSimilarDirectionIndex] if (mostSimilarDirectionIndex >=0 ) else -1

func _physics_process(delta):
	if linear_velocity.length() <= 0.005:
		on_stop()
	#print(getNumber(numberFaces))

func on_stop():
	print(getNumber(numberFaces))

func loadValuesD6():
	if direction.size() == 0:
		direction.append(Vector3.UP)
		values.append(2);
		direction.append(Vector3.DOWN);
		values.append(5); 
 
		direction.append(Vector3.LEFT);
		values.append(3); 
		direction.append(Vector3.RIGHT);
		values.append(4);
 
		direction.append(Vector3.FORWARD);
		values.append(6); 
		direction.append(Vector3.BACK);
		values.append(1);
