extends Node2D

func show_card_info(card_image, description):
	$CardImage.texture = card_image
	$RichTextLabel.text = description
	visible = true

func hide_card_info():
	visible = false
