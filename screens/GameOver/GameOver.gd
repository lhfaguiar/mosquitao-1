extends Node2D

func _ready():
	pass

func _on_TouchScreenButton_pressed():
	Loader.emit_signal("change_screen", "res://screens/TelaPrincipal/TelaPrincipal.tscn")
