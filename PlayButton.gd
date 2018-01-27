#extends Sprite
extends "../abstract_screen.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var currentScene = null
var newScene = null
var clickPlay = false

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)

func _on_play_pressed():
    emit_signal("next_screen", "game")

func _on_quit_pressed():
    get_tree().quit()

func _on_controls_pressed():
    emit_signal("next_screen", "controls")

func startPlay():
	#clean up the current scene
	currentScene.queue_free()
	#load the file passed in as the param "	scene"
	var s = ResourceLoader.load("TelaPrincipal")
	#create an instance of our scene
	newScene = s.instance()
	get_tree().get_root().add_child(newScene)
	get_tree().set_current_scene(newScene)\
	#current_scene.queue_free()
	currentScene = newScene
	
#func _process(delta):
	

