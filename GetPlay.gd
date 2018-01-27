extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
#this event is called once per key-press
    if event.is_action_pressed("PlayButton"):
		
		get_node("TelaPrincipal")