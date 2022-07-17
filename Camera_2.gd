extends Position3D


export var mouse_sensitivity = 5.0
export(NodePath) var target_path
onready var target = get_node(target_path)


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	translation = target.translation

func _input(event):
	if event is InputEventMouseMotion:
		var m_movement = event.relative
		rotation_degrees.y += - m_movement.x * mouse_sensitivity / 10
		rotation_degrees.x -= - m_movement.y * mouse_sensitivity / 10
		rotation_degrees.x = clamp(rotation_degrees.x, -15, 85)

