# Contains the game logic
extends Node

var current_screen
var fps

var screens = {
		"Menu": preload("res://screens/Menu/Menu.tscn"),
		"TelaPrincipal": preload("res://screens/TelaPrincipal/TelaPrincipal.tscn"),
		"Controls": preload("res://screens/Controls/Controls.tscn"),
	}
	
func _ready():
	setProcess_input(true)
	setProcess(true)
	currentScreen = find_node("screen")
	fps = find_node("fps")
	_load_screen("Menu")
	
func _input(event):
	if event.is_action("GameQuit"):
		_load_screen("Menu")
	
func _load_screen(name):
	if name in screens:
		var oldScreen = null
		if currentScreen.get_child_count() > 0:
			oldScreen = currentScreen.get_child(0)
		if old_screen != null:
			currentScreen.remove_child(oldScreen)

		var newScreen = screens[name].instance()
		newScreen.connect("nextScreen", self, "_load_screen")
		current_screen.add_child(newScreen)
	else:
		print("[ERROR] Cannot load screen: ", name)
		