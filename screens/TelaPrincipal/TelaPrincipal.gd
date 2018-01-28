extends Node2D

var INIMIGO = preload("res://OInimigo.tscn")
var speed = 40
var delay_spawn = speed * 0.08
var timer = delay_spawn
var on = true
var dificulty_mult = 0.2
var timer_total = 0

var loader
var frames
var max_time = 100
var current_scene

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
			loc.y += rand_range(-20, 20)
			if on:
				loc.x -= 50 * round(rand_range(-1, 1))
			else:
				loc.x += 50 * round(rand_range(-1, 1))
			alvo.set_pos(loc)
			alvo.set_gravity_scale(0)
			alvo.set_linear_velocity(Vector2(0, (speed * (timer_total / 100)) + speed))
			alvo.connect("game_over", self, "_end_game")
			add_child(alvo)
		on = not on

func _on_ParedeTopo_body_enter(body):
	body.queue_free()

func _end_game():
	Loader.emit_signal("change_screen", "res://screens/GameOver/GameOver.tscn")	

func _on_Sprite_visibility_changed():
	pass # replace with function body

#func _on_PlayButton_pressed():
	#get_tree().set_pause(false)
#	get_node("pause_popup").hide()

func _on_PauseButton_pressed():
	get_tree().set_pause(true)
	get_node("pop-up-wrap").get_node("pause_popup").show()

#TODO arrumar modal de pause
#func _on_play_button_pressed():
#	get_tree().set_pause(false)
#	get_node("pause_popup").hide()


func _on_buttonrestart_pressed():
	Loader.emit_signal("change_screen", "res://screens/Menu/Menu.tscn")	
