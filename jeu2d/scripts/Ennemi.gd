extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var player = null
var velocity= Vector2.ZERO
var speed=100
var hp = 40

onready var balle1 = preload("res://scenes/BalleEnnemi1.tscn")


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
	var b1 = balle1.instance() 
	b1.position = get_global_position()+ Vector2(50, 0)
	b1.player = player
	get_parent().add_child(b1)
	var b2 = balle1.instance() 
	b2.position = get_global_position()+ Vector2(100, 0)
	b2.player = player
	get_parent().add_child(b2)
	$Timer.set_wait_time(1)

func touch():
	hp -= 20
	$"/root/Score".Score +=30
	if hp <= 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if body != self:
		player = body
		shoot()


func _on_Area2D2_body_entered(body):
	if "player" in body.name:
		body.collisionennemi()
		queue_free()


func _on_Area2D_body_exited(body):
	player = null


func _on_Timer_timeout():
	if player != null :
		shoot()
