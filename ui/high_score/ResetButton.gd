extends Button

@onready var local_score_label: Label = $"../../ScoresVbox/LocalHBox/LocalScoreLabel"


func _on_button_down() -> void:
	Utils.save_score(0)
	local_score_label.text = "0"
