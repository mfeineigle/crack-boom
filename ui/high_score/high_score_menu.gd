extends Control

@onready var local_scores_v_box: VBoxContainer = %LocalScoresVBox
@onready var local_scores: Array = local_scores_v_box.get_children()


func _ready() -> void:
	var old_scores: Array = Utils.load_score()
	for i in range(local_scores.size()):
		local_scores[i].text = str(old_scores[i])
