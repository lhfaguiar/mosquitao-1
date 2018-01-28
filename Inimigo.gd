extends RigidBody2D

var ovo = preload("res://Objects/ovo.png")
var larva = preload("res://Objects/larva.png")
var mosquito = preload("res://Objects/mosquito.png")
var mosquitao = preload("res://Objects/mosquitao.png")
var vida = 1
onready var sprite = get_node("ovo")
onready var timer = get_node("timer")
signal game_over

func _ready():
	set_process(true)
	timer.set_wait_time(rand_range(8, 22))
	for _ in range(0, rand_range(0, 3)):
		_on_Timer_timeout()

func _on_Bolha_body_enter( body ):
	if "projetil" in body.get_name().to_lower():
		vida -= 1
		print(vida)
		if vida <= 0:
			queue_free()
		body.queue_free()

func _process(delta):
	if get_pos().y > 2000:
		emit_signal("game_over")
		queue_free()

func _on_Timer_timeout():
	if sprite.get_name() == "ovo":
		sprite.set_name("larva")
		sprite.set_texture(larva)
		set_scale(Vector2(1.2, 1.2))
		vida = 2
		timer.set_wait_time(rand_range(7, 20))
	elif sprite.get_name() == "larva":
		sprite.set_name("mosquito")
		sprite.set_texture(mosquito)
		vida = 3
		set_scale(Vector2(1.4, 1.4))
		timer.set_wait_time(rand_range(20, 45))
	elif sprite.get_name() == "mosquito":
		sprite.set_name("mosquitao")
		sprite.set_texture(mosquitao)
		vida = 4
		set_scale(Vector2(1.8, 1.8))
		timer.set_wait_time(rand_range(40, 60))
	else:
		return
	timer.start()
	
	
