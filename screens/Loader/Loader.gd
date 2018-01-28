extends Node


signal change_screen(path)

var current_scene

func _ready():
	hide()
	connect("change_screen", self, "_render_loader")

func _render_loader(path):
	show()
	var result_loader = ResourceLoader.load_interactive(path)
	var err = result_loader.poll()
	
	if err == ERR_FILE_EOF:
		var resource = result_loader.get_resource()
		hide()
		var current_scene = resource.instance()
		#TODO resolver questao de livrar arvore de cenas
		get_node("/root").add_child(current_scene)
