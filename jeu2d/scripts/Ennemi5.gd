extends KinematicBody2D
var player = null
var velocity= Vector2.ZERO
var speed=100
var hp = 45

onready var balle1 = preload("res://scenes/Balle3.tscn")


# warning-ignore:unused_argument
func _physics_process(delta):
	velocity = Vector2.ZERO
	if player != null:
		velocity = position.direction_to(player.position) * speed
	else:
		velocity = Vector2(0,0)

	velocity = velocity.normalized()
	velocity = move_and_collide(velocity)


func shoot():
	var b = balle1.instance() 
	b.position = get_global_position()
	b.player = player
	get_parent().add_child(b)
	var b2 = balle1.instance() 
	b2.position = get_global_position() + Vector2(50, 0)
	b2.player = player
	get_parent().add_child(b2)
	var b3 = balle1.instance() 
	b3.position = get_global_position() + Vector2(100, 0)
	b3.player = player
	get_parent().add_child(b3)
	$Timer.set_wait_time(1)

func _on_Area2D_body_entered(body):
	if body != self:
		player = body
		shoot()

func touch():
	hp -= 30
	$"/root/Score".Score +=20
	if hp <= 0:
		queue_free()

func collisionjoueur():
	hp = 0
	$"/root/Score".Score +=5
	queue_free()

# warning-ignore:unused_argument
func _on_Area2D_body_exited(body):
	player = null


func _on_Timer_timeout():
	if player != null :
		shoot()


func _on_Area2D2_body_entered(body):
	if "player" in body.name:
		body.collisionennemi()
		queue_free()
