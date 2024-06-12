extends Button

@onready var title_menu: Control = $"../.."
@onready var high_score_menu = preload("res://ui/high_score_menu.tscn").instantiate()

func _on_button_down() -> void:
	# remove all children
	for i in title_menu.get_children():
		i.queue_free()
	# swap in main scene
	title_menu.replace_by(high_score_menu)
