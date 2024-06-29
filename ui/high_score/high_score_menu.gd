extends Control


@onready var local_score_label: Label = $TextureRect/ScoresVbox/LocalHBox/LocalScoreLabel

func _ready() -> void:
	local_score_label.text = str(Utils.load_score())
