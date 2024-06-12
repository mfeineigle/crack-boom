extends Button

@onready var title_menu: Control = $"../.."
@onready var main = preload("res://main.tscn").instantiate()

func _on_button_down() -> void:
	# remove all children
	for i in title_menu.get_children():
		i.queue_free()
	# swap in main scene
	title_menu.replace_by(main)


