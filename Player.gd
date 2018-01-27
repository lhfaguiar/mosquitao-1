extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var TURN_SPEED = deg2rad(1)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	# Declara dois booleans pra verificar se tecla pressinada e rota
	var direita = Input.is_action_pressed("gira_direita") && rad2deg(get_rot()) > 125
	var esquerda = Input.is_action_pressed("gira_esquerda") && rad2deg(get_rot()) < 235

	if (direita && esquerda):
		return
	if (direita):
		rotate(-TURN_SPEED)
	if (esquerda):
		rotate(TURN_SPEED)
