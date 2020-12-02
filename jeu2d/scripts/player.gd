extends KinematicBody2D

var speed=180
var velocity= Vector2(0,0)
onready var anim = $Player_Defense
var hp = 80
var mort = false
var balle = preload("res://scenes/Balle.tscn")
var zone = false


func _ready():
	anim.play("default")

func _deplacement():
	if(Input.is_action_pressed("droite")):
		velocity.x = speed
		anim.play("speed")
	elif(Input.is_action_pressed("gauche")):
		velocity.x = -speed
		anim.play("speed")
	elif(Input.is_action_pressed("recule")):
		velocity.y = speed
		anim.play("speed")
	elif(Input.is_action_pressed("avance")):
		velocity.y = -speed
		anim.play("speed")
	else:
		velocity.x = 0
		velocity.y = 0
		anim.play("default")
	if Input.is_action_just_pressed('mouse_click'):
		shoot()
	
func shoot():
	var b = balle.instance()
	$AudioStreamPlayer.play()
	b.start($Position2D.global_position, rotation)
	get_parent().add_child(b)
	
func touch1():
	hp -= (5*hp)/100
	if hp <= 4:
		$mort.play()
		get_tree().change_scene("res://scenes/GameOver.tscn")

func touch2():
	hp -= (10*hp)/100
	if hp <= 4:
		$mort.play()
		get_tree().change_scene("res://scenes/GameOver.tscn")

func touch3():
	hp -= (20*hp)/100
	if hp <= 4:
		$mort.play()
		get_tree().change_scene("res://scenes/GameOver.tscn")

func collisionennemi():
	hp -= (15*hp)/100
	if hp <= 0:
		$mort.play()
		get_tree().change_scene("res://scenes/GameOver.tscn")
	
func _physics_process(delta):
	_deplacement()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		position = position + velocity * delta
	velocity = move_and_slide(velocity)




func _on_Area2D_body_entered(body):
	if "Ennemi1" in body.name:
		body.collisionjoueur()
		queue_free()
	if "Ennemi2" in body.name:
		body.collisionjoueur()
		queue_free()
	if "Ennemi3" in body.name:
		body.collisionjoueur()
		queue_free()
	if "Ennemi4" in body.name:
		body.collisionjoueur()
		queue_free()
	if "Ennemi5" in body.name:
		body.collisionjoueur()
		queue_free()
