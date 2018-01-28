extends RigidBody2D

var ovo = preload("res://Objects/ovo.png")
var larva = preload("res://Objects/larva.png")
var mosquito = preload("res://Objects/mosquito.png")
var mosquitao = preload("res://Objects/mosquitao.png")
var vida = 1
onready var sprite = get_node("ovo")
onready var timer = get_node("timer")

func _ready():
	set_process(true)

func _on_Bolha_body_enter( body ):
	if "projetil" in body.get_name().to_lower():
		vida -= 1
		print(vida)
		if vida <= 0:
			queue_free()
		body.queue_free()

func _process(delta):
	if get_pos().y > 2000:
		queue_free()

func _on_Timer_timeout():
	if sprite.get_name() == "ovo":
		sprite.set_name("larva")
		sprite.set_texture(larva)
		set_scale(Vector2(1.2, 1.2))
		vida = 2
		timer.set_wait_time(rand_range(4, 8))
	elif sprite.get_name() == "larva":
		sprite.set_name("mosquito")
		sprite.set_texture(mosquito)
		vida = 3
		set_scale(Vector2(1.4, 1.4))
		timer.set_wait_time(rand_range(6, 14))
	elif sprite.get_name() == "mosquito":
		sprite.set_name("mosquitao")
		sprite.set_texture(mosquitao)
		vida = 4
		set_scale(Vector2(1.8, 1.8))
		timer.set_wait_time(rand_range(13, 20))
	else:
		return
	timer.start()
	
	