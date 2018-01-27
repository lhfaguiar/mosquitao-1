extends Node2D

var INIMIGO = preload("res://OInimigo.tscn")
var speed = 150
var delay_spawn = 1
var timer = delay_spawn
var on = true
var dificulty_mult = 0.2
var timer_total = 0

func _ready():
	set_process(true)

func _process(delta):
	timer_total += delta
	timer += delta
	if timer >= delay_spawn:
		timer = 0
		delay_spawn -= delay_spawn * 0.01
		for x in range(1, 8):
			var alvo = INIMIGO.instance()
			var loc = Vector2(x * 135, -100)
			if on:
				loc.x -= 50
			else:
				loc.x += 50
			alvo.set_pos(loc)
			alvo.set_gravity_scale(0)
			alvo.set_linear_velocity(Vector2(0, (speed * (timer_total / 100)) + speed))
			add_child(alvo)
		on = not on

func _on_ParedeTopo_body_enter(body):
	body.queue_free()
