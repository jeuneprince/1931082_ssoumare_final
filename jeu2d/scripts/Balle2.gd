extends Area2D

var speed = 10
var velocity = Vector2.ZERO
var look = Vector2.ZERO
var player = null


# Called when the node enters the scene tree for the first time.
func _ready():
	look = player.position - global_position


func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity = velocity.move_toward(look, delta)
	velocity = velocity.normalized() * speed
	position += velocity


func _on_Balle2_body_entered(body):
	if "player" in body.name:
		body.touch2()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
