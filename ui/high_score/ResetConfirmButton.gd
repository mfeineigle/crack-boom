extends Button

@onready var scores_v_box: VBoxContainer = %ScoresVBox
@onready var scores: Array = scores_v_box.get_children()
@onready var times_v_box: VBoxContainer = %TimesVBox
@onready var times: Array = times_v_box.get_children()
@onready var reset_confirm_texture_rect: TextureRect = %ResetConfirmTextureRect
@onready var reset_button: Button = %ResetButton
@onready var back_button: Button = %BackButton


func _on_button_down() -> void:
	# reset scores
	var file = FileAccess.open(Globals.score_save_path, FileAccess.WRITE)
	file.store_var([0,0,0,0,0])
	for i in range(scores.size()):
		scores[i].text = "0"
	# reset times
	file = FileAccess.open(Globals.time_save_path, FileAccess.WRITE)
	file.store_var([0.0, 0.0, 0.0, 0.0, 0.0])
	for i in range(times.size()):
		times[i].text = "0.0"
	# show hide buttons
	reset_confirm_texture_rect.visible = false
	reset_button.visible = true
	back_button.visible = true
