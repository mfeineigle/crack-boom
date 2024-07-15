extends Control

@onready var scores_v_box: VBoxContainer = %ScoresVBox
@onready var scores: Array = scores_v_box.get_children()
@onready var times_v_box: VBoxContainer = %TimesVBox
@onready var times: Array = times_v_box.get_children()

func _ready() -> void:
	# load scores
	var old_scores: Array = Utils.load_score()
	for i in range(scores.size()):
		scores[i].text = str(old_scores[i])
	# load times
	var old_times: Array = Utils.load_time()
	for i in range(times.size()):
		times[i].text = str(old_times[i])
