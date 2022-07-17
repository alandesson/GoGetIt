extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dice_coords = $D4.translation
	$D4.queue_free()
	match ChooseDice.dice_choice:
		4:
			var new_dice = load("res://Dados/D4.tscn").instance()
			new_dice.translation = dice_coords
			add_child(new_dice)
		6:
			var new_dice = load("res://Dados/D6.tscn").instance()
			new_dice.translation = dice_coords
			add_child(new_dice)
		8:
			var new_dice = load("res://Dados/D8.tscn").instance()
			new_dice.translation = dice_coords
			add_child(new_dice)
		12:
			var new_dice = load("res://Dados/D12.tscn").instance()
			new_dice.translation = dice_coords
			add_child(new_dice)
		20:
			var new_dice = load("res://Dados/D20.tscn").instance()
			new_dice.translation = dice_coords
			add_child(new_dice)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FinishingArea_body_entered(body):
	if(body.is_in_group("Dice")):
		$UI/CongratulationsPanel.visible = true;
