extends Node2D

var MOSQUITAO = preload("res://cenas/mosquitao.tscn")
var MOSQUITO = preload("res://cenas/mosquito.tscn")
var LARVA = preload("res://cenas/larva.tscn")
var OVO = preload("res://cenas/ovo.tscn")
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
	get_node("background/Background2_folhas/valor_pt").set_text(String(Loader.score))
	#get_node("valor_pt").set_text(Loader.score)

func _process(delta):
	timer_total += delta
	timer += delta
	if timer >= delay_spawn:
		timer = 0
		delay_spawn -= delay_spawn * 0.01
		for x in range(1, 8):
			var alvo
			var qual = randf()
			if qual < 0.8:
				alvo = OVO.instance()
			elif qual < 0.9:
				alvo = LARVA.instance()
			elif qual < 0.98:
				alvo = MOSQUITO.instance()
			else: #elif qual < 0.02:
				alvo = MOSQUITAO.instance()
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
			alvo.connect("dead", self, "_score")
			add_child(alvo)
		on = not on

func _on_ParedeTopo_body_enter(body):
	body.queue_free()


func _score(name):
	if "ovo" in name.to_lower():
		Loader.score += 1
	elif "larva" in name.to_lower():
		Loader.score += 10
	elif "mosquito" in name.to_lower():
		Loader.score += 50
	elif "mosquitao" in name.to_lower():
		Loader.score += 100
	get_node("background/Background2_folhas/valor_pt").set_text(String(Loader.score))
	
	
		
func _end_game():
	Loader.emit_signal("change_screen", "res://screens/GameOver/GameOver.tscn")	

func _on_PauseButton_pressed():
	get_tree().set_pause(true)
	get_node("pop-up-wrap").get_node("pause_popup").show()

#TODO arrumar modal de pause
#func _on_play_button_pressed():
#	get_tree().set_pause(false)
#	get_node("pause_popup").hide()


func _on_buttonrestart_pressed():
	Loader.emit_signal("change_screen", "res://screens/Menu/Menu.tscn")	


func _on_valor_pt_script_changed():
	pass # replace with function body
