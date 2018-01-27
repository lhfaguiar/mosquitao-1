# Contains the logic for the main menu screen
extends "../AbstractScreen.gd"

func _on_play_pressed():
	emit_signal("next_screen", "TelaPrincipal")

func _on_quit_pressed():
	get_tree().quit()

#func _on_controls_pressed():
#	emit_signal("next_screen", "Controls")