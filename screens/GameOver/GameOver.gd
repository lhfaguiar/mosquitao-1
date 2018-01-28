extends Node2D

func _ready():
	get_node("valor_pt").set_text(String(Loader.score))

func _on_TouchScreenButton_pressed():
	Loader.emit_signal("change_screen", "res://screens/TelaPrincipal/TelaPrincipal.tscn")


func _on_Label_item_rect_changed():
	pass # replace with function body
