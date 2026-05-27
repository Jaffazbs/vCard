extends Node

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree, context = null):
	var mascots = []
	for card_name in deck.player_deck:
		var data = deck.card_database_reference.CARDS[card_name]
		if data[1] == "mascot":
			mascots.append(card_name)
	
	if mascots.is_empty():
		print("No mascots in deck.")
		return
	
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.7)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	var x = 400
	for card_name in mascots:
		var tex_rect = TextureRect.new()
		tex_rect.texture = load("res://Assets/" + card_name + ".png")
		tex_rect.custom_minimum_size = Vector2(220, 308)
		tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tex_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tex_rect.position = Vector2(x, 200)
		tex_rect.gui_input.connect(func(event):
			if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				deck.player_deck.erase(card_name)
				deck.draw_specific_card(card_name)
				overlay.queue_free()
		)
		overlay.add_child(tex_rect)
		x += 240
	
	card_manager.get_tree().root.add_child(overlay)
