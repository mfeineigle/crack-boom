extends Button

@onready var game_over_menu: Control = $"../.."
@onready var main = preload("res://main.tscn").instantiate()

func _on_button_down() -> void:
	# remove all children
	for i in game_over_menu.get_children():
		i.queue_free()
	# swap in main scene
	game_over_menu.replace_by(main)
