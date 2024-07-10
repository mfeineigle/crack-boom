extends Button

@onready var reset_confirm_texture_rect: TextureRect = %ResetConfirmTextureRect
@onready var reset_button: Button = %ResetButton
@onready var back_button: Button = %BackButton

func _on_button_down() -> void:
	reset_confirm_texture_rect.visible = false
	reset_button.visible = true
	back_button.visible = true
