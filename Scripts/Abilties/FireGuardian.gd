extends Node

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	var backstage_slots = [
		card_manager.get_node("../CardSlots/CardSlot6"),
		card_manager.get_node("../CardSlots/CardSlot7"),
		card_manager.get_node("../CardSlots/CardSlot8"),
		card_manager.get_node("../CardSlots/CardSlot9"),
	]
	
	# Find fire VTs on backstage
	var backstage_fire_vts = []
	for slot in backstage_slots:
		if slot.card_in_slot and slot.card_in_slot is Node2D:
			if slot.card_in_slot.card_vt_type == "fire":
				backstage_fire_vts.append(slot.card_in_slot)
	
	# Find matching cards in deck
	var option_a = [] # evolving VTs
	var option_b = [] # PL8 fire VTs
	
	for card_name in deck.player_deck:
		var data = deck.card_database_reference.CARDS[card_name]
		if data[1] == "vt" and data.size() > 5 and data[5] == "fire":
			if data[2] == 8:
				option_b.append(card_name)
			for backstage_vt in backstage_fire_vts:
				if data[2] == backstage_vt.card_pl + 1:
					if card_name not in option_a:
						option_a.append(card_name)
	
	show_search_ui(card_manager, deck, option_a, option_b)

func show_search_ui(card_manager, deck, option_a, option_b):
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.7)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	var btn_a = Button.new()
	btn_a.text = "Search Evolving Fire VT"
	btn_a.position = Vector2(700, 400)
	btn_a.pressed.connect(func():
		overlay.queue_free()
		show_card_choices(card_manager, deck, option_a)
	)
	
	var btn_b = Button.new()
	btn_b.text = "Search Fire PL8 VT"
	btn_b.position = Vector2(700, 450)
	btn_b.pressed.connect(func():
		overlay.queue_free()
		show_card_choices(card_manager, deck, option_b)
	)
	
	overlay.add_child(btn_a)
	overlay.add_child(btn_b)
	card_manager.get_tree().root.add_child(overlay)

func show_card_choices(card_manager, deck, card_names):
	if card_names.is_empty():
		print("No matching cards in deck.")
		return
	
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.7)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	var x = 400
	for card_name in card_names:
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
