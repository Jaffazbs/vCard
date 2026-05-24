extends Node2D

var discard_pile = []

func add_card(card_name):
	discard_pile.append(card_name)
	$RichTextLabel.text = str(discard_pile.size())
	var texture = load("res://Assets/" + card_name + ".png")
	if texture:
		$Sprite2D.texture = texture
		var tex_size = texture.get_size()
		$Sprite2D.scale = Vector2(220, 308) / tex_size * 0.37
	visible = true
