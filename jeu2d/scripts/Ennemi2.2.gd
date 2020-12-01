extends KinematicBody2D

var player = null
var velocity= Vector2.ZERO
var speed=100
var hp = 40

onready var balle1 = preload("res://scenes/Balle2.tscn")


# Called when the node enters the scene tree for the first time.
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
	$missile.play()
	b.position = get_global_position()
	b.player = player
	get_parent().add_child(b)
	$Timer.set_wait_time(1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if player != null :
		shoot()


func _on_Area2D_body_entered(body):
	if body != self:
		player = body
		shoot()
		
func touch():
	hp -= 25
	$"/root/Score".Score +=20
	if hp <= 0:
		$ennemimort.play()
		$"/root/Ennemi2".Ennemi2 -= 1
		queue_free()

func collisionjoueur():
	hp = 0
	$"/root/Score".Score +=5
	$"/root/Ennemi2".Ennemi2 -= 1
	queue_free()
	
func _on_Area2D_body_exited(body):
	player = null


func _on_Area2D2_body_entered(body):
	if "player" in body.name:
		body.collisionennemi()
		queue_free()
		$"/root/Ennemi2".Ennemi2 -= 1
