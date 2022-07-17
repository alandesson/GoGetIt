extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_d4_pressed():
	ChooseDice.dice_choice = 4
	get_tree().change_scene_to(load("res://Level2.tscn"))


func _on_d6_pressed():
	ChooseDice.dice_choice = 6
	get_tree().change_scene_to(load("res://Level2.tscn"))


func _on_d8_pressed():
	ChooseDice.dice_choice = 8
	get_tree().change_scene_to(load("res://Level2.tscn"))


func _on_d12_pressed():
	ChooseDice.dice_choice = 12
	get_tree().change_scene_to(load("res://Level2.tscn"))


func _on_d20_pressed():
	ChooseDice.dice_choice = 20
	get_tree().change_scene_to(load("res://Level2.tscn"))
