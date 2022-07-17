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
	get_tree().change_scene_to(load("res://Level2_d4"))


func _on_d6_pressed():
	get_tree().change_scene_to(load("res://Level2_d4"))


func _on_d8_pressed():
	get_tree().change_scene_to(load("res://Level2_d4"))


func _on_d12_pressed():
	get_tree().change_scene_to(load("res://Level2_d4"))


func _on_d20_pressed():
	get_tree().change_scene_to(load("res://Level2_d4"))
