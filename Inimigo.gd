extends RigidBody2D

func _ready():
	set_process(true)

func _on_Bolha_body_enter( body ):
	print(body.get_name())
	if "projetil" in body.get_name().to_lower():
		body.queue_free()
		queue_free()

func _process(delta):
	if get_pos().y > 2000:
		queue_free()
