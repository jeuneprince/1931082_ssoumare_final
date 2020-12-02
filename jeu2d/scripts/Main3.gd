extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$CanvasLayer/ColorRect/ProgressBar.value = $player.hp
	$CanvasLayer/ColorRect/Label.text = str($"/root/Score".Score)
	if ($"/root/Ennemi".Ennemi == 0) :
		get_tree().change_scene("res://scenes/Victoire.tscn")
