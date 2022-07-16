extends Spatial


var camera_h = 0
var camera_v = 0


func _ready():
	pass
	#$Horizontal/Vertical/Camera.add_exception(get_parent())
	
	
func _input(event):
	if event is InputEventMouseMotion:
		camera_h += -event.relative.x
		camera_v += -event.relative.y
		camera_v = clamp(camera_v, -45, 85)


func _physics_process(delta):
	$Horizontal.rotation_degrees.y = camera_h
	$Horizontal/Vertical.rotation_degrees.x = camera_v
