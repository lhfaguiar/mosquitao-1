extends Sprite


#x cos
#y sen
# em segundos
const TURN_SPEED = deg2rad(4)
const DELAY_TIRO = 0.01
const MIN_ANGULO = deg2rad(125)
const MAX_ANGULO = deg2rad(235)
# Ja comeca liberado
var timer = DELAY_TIRO
var botao_segurado = false
onready var PROJETIL = preload("res://Projetil.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_process_input(true)

func _process(delta):
	# Adicina delta (secs desde ultima frame)
	timer += delta
	var rads = get_rot()
	var direita = Input.is_action_pressed("gira_direita") && rads > MIN_ANGULO
	var esquerda = Input.is_action_pressed("gira_esquerda") && rads < MAX_ANGULO
	var botao_atirar = Input.is_action_pressed("atirar")

	if botao_atirar and timer > DELAY_TIRO and not botao_segurado:
		botao_segurado = true
		var projetil = PROJETIL.instance()
		var mat_accel = Vector2(0, -2000)
		mat_accel = mat_accel.rotated(rads - PI)
		projetil.set_linear_velocity(mat_accel)
		#TODO acertar velocidade dos projetos
		#projetil.apply_impulse(Vector2(1000, 2000), Vector2(1000, 3000))
		projetil.set_pos(get_pos())
		projetil.set_inertia(5)
		projetil.set_angular_velocity(0.5)
		get_parent().add_child(projetil)
		timer = 0
	botao_segurado = botao_atirar

	if (direita and esquerda) or Input.is_mouse_button_pressed(1):
		return
	if direita:
		rotate(-TURN_SPEED)
	elif esquerda:
		rotate(TURN_SPEED)

func _input(ev):
	if ((ev.type == InputEvent.MOUSE_BUTTON and ev.pressed) or 
			(ev.type == InputEvent.MOUSE_MOTION and botao_segurado)):
		#TODO Max angle
		set_rot(max(min(get_pos().angle_to_point(ev.pos) + PI, MAX_ANGULO), MIN_ANGULO))
