extends Node2D

func show_card_info(card_image, description):
	$CardImage.texture = card_image
	var tex_size = card_image.get_size()
	$CardImage.scale = Vector2(588, 801) / tex_size
	$RichTextLabel.text = description
	visible = true

func hide_card_info():
	visible = false
