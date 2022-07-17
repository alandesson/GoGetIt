extends RigidBody

var numberFaces

func _ready():
	numberFaces = name.trim_prefix("D").to_int()
	Awake(numberFaces)
	print(numberFaces)
	pass

var direction = []
var values = []

func Awake(numberFaces):
	if numberFaces==4:
		loadValuesD4()
	if numberFaces==6:
		loadValuesD6()
	if numberFaces==8:
		loadValuesD8()
	if numberFaces==12:
		loadValuesD12()
	if numberFaces==20:
		loadValuesD20()

var vectorUPglobal = (Vector3.UP) if numberFaces != 4 else (Vector3.DOWN)

func getNumber(numberFaces):
	var minDifference = 180.0
	var mostSimilarDirectionIndex = -1
	for i in range(0,direction.size()):
		var a = rad2deg(vectorUPglobal.angle_to(to_global(direction[i])-translation))
		# print(a)
		if a <= minDifference :
			minDifference = a
			mostSimilarDirectionIndex = i
	return values[mostSimilarDirectionIndex] if (mostSimilarDirectionIndex >=0 ) else -1

func _physics_process(delta):
	if linear_velocity.length() <= 0.005:
		on_stop()
	#print(getNumber(numberFaces))

func on_stop():
	print(str(name) + ": " + str(getNumber(numberFaces)))

func loadValuesD4():
	if direction.size() == 0:
		direction.append(Vector3.DOWN)
		values.append(1)
		
		direction.append(Vector3(-0.94280904,1.0/3.0,0))
		values.append(2)
		
		direction.append(Vector3(0.4714,1.0/3.0,0.8165))
		values.append(3)
		
		direction.append(Vector3(0.4714,1.0/3.0,-0.8165))
		values.append(4)

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

func loadValuesD8():
	if direction.size() == 0:
		direction.append(Vector3(1,1,1))
		values.append(1)
		
		direction.append(Vector3(1,1,-1))
		values.append(2)
		
		direction.append(Vector3(1,-1,1))
		values.append(3)
		
		direction.append(Vector3(1,-1,-1))
		values.append(4)
		
		direction.append(Vector3(-1,1,1))
		values.append(5)
		
		direction.append(Vector3(-1,1,-1))
		values.append(6)
		
		direction.append(Vector3(-1,-1,1))
		values.append(7)
		
		direction.append(Vector3(-1,-1,-1))
		values.append(8)

func loadValuesD12():
	if direction.size() == 0:
		direction.append(Vector3.UP)
		values.append(1)
		direction.append(Vector3.DOWN)
		values.append(12)
		
		direction.append(Vector3(-0.4472135,0.894427,0))
		values.append(11)
		
		direction.append(Vector3(-0.1382,0.894427,0.42533))
		values.append(10)
		
		direction.append(Vector3(-0.1382,0.894427,-0.42533))
		values.append(9)
		
		direction.append(Vector3(0.3618,0.894427,0.2629))
		values.append(8)
		
		direction.append(Vector3(0.3618,-0.894427,-0.2629))
		values.append(7)
		
		direction.append(Vector3(0.4472135,-0.894427,0))
		values.append(2)
		
		direction.append(Vector3(0.1382,-0.894427,-0.42533))
		values.append(3)
		
		direction.append(Vector3(0.1382,-0.894427,0.42533))
		values.append(4)
		
		direction.append(Vector3(-0.3618,-0.894427,-0.2629))
		values.append(5)
		
		direction.append(Vector3(-0.3618,-0.894427,0.2629))
		values.append(6)

func loadValuesD20():
	if direction.size() == 0:
		direction.append(Vector3.UP)
		values.append(1)
		direction.append(Vector3.DOWN)
		values.append(20)
		
		direction.append(Vector3(0.5774, 0.7454, 0.3333))
		values.append(2)
		
		direction.append(Vector3(0.5774, -0.3333, 0.7454))
		values.append(3)
		
		direction.append(Vector3(0.5774, 0.3333, -0.7454))
		values.append(4)
		
		direction.append(Vector3(0.5774, -0.7454, -0.3333))
		values.append(5)
		
		direction.append(Vector3(-0.5774, 0.7454,0.3333))
		values.append(16)
		
		direction.append(Vector3(-0.5774, -0.3333, 0.7454))
		values.append(17)
		
		direction.append(Vector3(-0.5774, 0.3333, -0.7454))
		values.append(18)
		
		direction.append(Vector3(-0.5774, -0.7454, -0.3333))
		values.append(19)
		
		direction.append(Vector3(0.3568, 0.3333, 0.8727))
		values.append(7)
		
		direction.append(Vector3(-0.3568, 0.3333, 0.8727))
		values.append(8)
		
		direction.append(Vector3(0.3568, -0.3333,-0.8727))
		values.append(13)
		
		direction.append(Vector3(-0.3568, -0.3333,-0.8727))
		values.append(14)
		
		direction.append(Vector3(0.9342, 0.3333, -0.1273))
		values.append(9)
		
		direction.append(Vector3(0.9342,-0.3333 ,0.1273))
		values.append(10)
		
		direction.append(Vector3(-0.9342, 0.3333, -0.1273))
		values.append(11)
		
		direction.append(Vector3(-0.9342,-0.3333 ,0.1273))
		values.append(12)
		
		direction.append(Vector3(0.0000, 0.7454, -0.6667))
		values.append(6)
		
		direction.append(Vector3(0.0000, -0.7454,0.6667))
		values.append(15)
		
