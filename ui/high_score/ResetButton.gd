extends Button

@onready var reset_confirm_texture_rect: TextureRect = %ResetConfirmTextureRect
@onready var reset_button: Button = %ResetButton
@onready var back_button: Button = %BackButton

func _on_reset_button_down() -> void:
	reset_confirm_texture_rect.visible = true
	reset_button.visible = false
	back_button.visible = false
