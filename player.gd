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
	var direita = Input.is_action_pressed("gira_direita") && rad2deg(get_rot()) < 105
	var esquerda = Input.is_action_pressed("gira_esquerda") && rad2deg(get_rot()) > 255
	
	if (direita && esquerda):
		return
	if (direita):
		print(rad2deg(get_rot()))
		rotate(-TURN_SPEED)
	if (esquerda):
		
		rotate(TURN_SPEED)
