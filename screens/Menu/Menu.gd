# Contains the logic for the main menu screen
extends "../AbstractScreen.gd"

func _on_PlayButton_pressed():
	Loader.emit_signal("change_screen", "res://screens/TelaPrincipal/TelaPrincipal.tscn")	

func _on_ExitButton_pressed():
	get_tree().quit()
	