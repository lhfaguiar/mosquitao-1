extends Node

signal change_screen(path)

var current_scene
var result_loader 

func _ready():
	hide()
	connect("change_screen", self, "_render_loader")
	set_process(false)
	
func _process(delta):
	var err = result_loader.poll()
	print(err)
	if err == OK:
		return
	if err == ERR_FILE_EOF:
		call_deferred("_change_screen")

func _change_screen():
	current_scene.free()
	var resource = result_loader.get_resource().instance()
	get_tree().get_root().add_child(resource)
	get_tree().set_current_scene(resource)
	hide()
	set_process(false)

func _render_loader(path):
	show()
	var root = get_tree().get_root()
	result_loader = ResourceLoader.load_interactive(path)
	current_scene = root.get_child( root.get_child_count() -1 )
	set_process(true)
