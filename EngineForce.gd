extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocity;

func _process(delta):
	velocity = get_node("../Player").linear_velocity;
	velocity.y = 0;
	self.value = velocity.length_squared();
	
