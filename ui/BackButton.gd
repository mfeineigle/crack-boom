extends Button

@onready var high_score_menu: Control = $"../.."
@onready var title_menu = load("res://ui/title_menu.tscn").instantiate()

func _on_button_down() -> void:
	# remove all children
	for i in high_score_menu.get_children():
		i.queue_free()
	# swap in main scene
	high_score_menu.replace_by(title_menu)
