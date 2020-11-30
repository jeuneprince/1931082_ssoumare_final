extends Area2D

var speed = 700
var velocity = Vector2()
func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _ready():
	set_physics_process(true)


func _physics_process(delta):
	position = position + velocity * delta
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Balle_body_entered(body):
	if "Ennemi1" in body.name:
		body.touch()
		queue_free()
	if "Ennemi2" in body.name:
		body.touch()
		queue_free()
	if "Ennemi3" in body.name:
		body.touch()
		queue_free()
	if "Ennemi4" in body.name:
		body.touch()
		queue_free()
	if "Ennemi5" in body.name:
		body.touch()
		queue_free()
	
	
	

