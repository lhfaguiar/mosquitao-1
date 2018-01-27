extends Area2D


func _on_Area2D_body_enter( body ):	
	body.queue_free()

func _on_Inpacto_body_enter( body ):
	print("WOW IT ACTUALLY WORKS")
