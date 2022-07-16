extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var cur_target = 1
onready var path = []
export var speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	var path_size = $Path.curve.get_point_count()
	for point in range(path_size):
		path.append(to_global($Path.curve.get_point_position(point)))

func _physics_process(delta):
	var dist = path[cur_target] - translation
	if  dist.length() > 0.1:
		var move_len = clamp(speed * 0.01, 0, dist.length())
		move_and_collide(dist.normalized() * move_len)
	else:
		cur_target = wrapi(cur_target+1, 0, path.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
