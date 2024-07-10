extends Button

@onready var local_scores_v_box: VBoxContainer = %LocalScoresVBox
@onready var local_scores: Array = local_scores_v_box.get_children()
@onready var reset_confirm_texture_rect: TextureRect = %ResetConfirmTextureRect
@onready var reset_button: Button = %ResetButton
@onready var back_button: Button = %BackButton


func _on_button_down() -> void:
	var file = FileAccess.open(Globals.save_path, FileAccess.WRITE)
	file.store_var([0,0,0,0,0])
	for i in range(local_scores.size()):
		local_scores[i].text = "0"
	reset_confirm_texture_rect.visible = false
	reset_button.visible = true
	back_button.visible = true
