extends Control

var catalogue = preload("res://Scripts/CardCatalogue.gd").new()
var card_database_reference = preload("res://Scripts/CardDataBase.gd")

const MAX_DECK_SIZE = 50
const MAX_COPIES_VT = 3
const MAX_COPIES_MASCOT = 2
const MAX_COPIES_SUPPORT = 3
const MAX_ELEMENTS = 2

var current_deck = {}
var deck_elements = {}
var pending_additions = {}

var deck_count_label
var vt_count_label
var support_count_label
var mascot_count_label
var elements_label
var validation_label
var deck_list_container
var status_container

func _ready():
	build_ui()

func build_ui():
	var main = VBoxContainer.new()
	main.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	main.offset_top = 72
	main.add_theme_constant_override("separation", 8)
	add_child(main)

	# Header
	var header = HBoxContainer.new()
	header.custom_minimum_size = Vector2(0, 40)
	main.add_child(header)

	var title = Label.new()
	title.text = "Deck Builder"
	title.add_theme_font_size_override("font_size", 24)
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_child(title)

	var save_btn = Button.new()
	save_btn.text = "Save Deck"
	save_btn.custom_minimum_size = Vector2(100, 36)
	save_btn.pressed.connect(save_deck)
	header.add_child(save_btn)

	var clear_btn = Button.new()
	clear_btn.text = "Clear Deck"
	clear_btn.custom_minimum_size = Vector2(100, 36)
	clear_btn.pressed.connect(clear_deck)
	header.add_child(clear_btn)

	# Status box
	var status_box = PanelContainer.new()
	status_box.custom_minimum_size = Vector2(0, 100)
	main.add_child(status_box)

	var status_vbox = VBoxContainer.new()
	status_vbox.add_theme_constant_override("separation", 4)
	status_box.add_child(status_vbox)

	var status_title = Label.new()
	status_title.text = "Deck Status"
	status_title.add_theme_font_size_override("font_size", 14)
	status_vbox.add_child(status_title)

	validation_label = Label.new()
	validation_label.text = "Deck needs 50 more cards to reach 50 cards"
	validation_label.add_theme_color_override("font_color", Color(1, 0.7, 0.2))
	validation_label.add_theme_font_size_override("font_size", 12)
	status_vbox.add_child(validation_label)

	var count_row = HBoxContainer.new()
	count_row.add_theme_constant_override("separation", 16)
	status_vbox.add_child(count_row)

	var count_label_title = Label.new()
	count_label_title.text = "Card Count"
	count_label_title.add_theme_font_size_override("font_size", 12)
	count_row.add_child(count_label_title)

	deck_count_label = Label.new()
	deck_count_label.text = "0 / 50"
	deck_count_label.add_theme_font_size_override("font_size", 18)
	deck_count_label.add_theme_color_override("font_color", Color(1, 0.85, 0.1))
	count_row.add_child(deck_count_label)

	vt_count_label = Label.new()
	vt_count_label.text = "VT: 0"
	vt_count_label.add_theme_font_size_override("font_size", 12)
	vt_count_label.add_theme_color_override("font_color", Color(0.5, 0.8, 1))
	count_row.add_child(vt_count_label)

	support_count_label = Label.new()
	support_count_label.text = "Support: 0"
	support_count_label.add_theme_font_size_override("font_size", 12)
	support_count_label.add_theme_color_override("font_color", Color(0.5, 0.7, 1))
	count_row.add_child(support_count_label)

	mascot_count_label = Label.new()
	mascot_count_label.text = "Mascot: 0"
	mascot_count_label.add_theme_font_size_override("font_size", 12)
	mascot_count_label.add_theme_color_override("font_color", Color(0.8, 0.5, 1))
	count_row.add_child(mascot_count_label)

	elements_label = Label.new()
	elements_label.text = "Elements: none"
	elements_label.add_theme_font_size_override("font_size", 12)
	count_row.add_child(elements_label)

	# Cards in deck section
	var cards_header = HBoxContainer.new()
	main.add_child(cards_header)

	var cards_title = Label.new()
	cards_title.text = "Cards in Deck"
	cards_title.add_theme_font_size_override("font_size", 16)
	cards_title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cards_header.add_child(cards_title)

	var add_btn = Button.new()
	add_btn.text = "+ Add Cards"
	add_btn.custom_minimum_size = Vector2(120, 32)
	add_btn.pressed.connect(open_card_browser)
	cards_header.add_child(add_btn)

	var deck_scroll = ScrollContainer.new()
	deck_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	main.add_child(deck_scroll)

	deck_list_container = VBoxContainer.new()
	deck_list_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	deck_list_container.add_theme_constant_override("separation", 2)
	deck_scroll.add_child(deck_list_container)

	refresh_deck_list()

func open_card_browser():
	pending_additions = {}

	var overlay = ColorRect.new()
	overlay.color = Color(0.05, 0.07, 0.12, 0.97)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.z_index = 10
	add_child(overlay)

	var vbox = VBoxContainer.new()
	vbox.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	vbox.add_theme_constant_override("separation", 6)
	overlay.add_child(vbox)

	# Browser header
	var header = HBoxContainer.new()
	header.custom_minimum_size = Vector2(0, 36)
	vbox.add_child(header)

	var title = Label.new()
	title.text = "Add Cards to Deck"
	title.add_theme_font_size_override("font_size", 18)
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_child(title)

	var close_btn = Button.new()
	close_btn.text = "X"
	close_btn.custom_minimum_size = Vector2(32, 32)
	close_btn.pressed.connect(func(): overlay.queue_free())
	header.add_child(close_btn)

	# Main content - grid + selected panel
	var content = HBoxContainer.new()
	content.size_flags_vertical = Control.SIZE_EXPAND_FILL
	content.add_theme_constant_override("separation", 8)
	vbox.add_child(content)

	# Card grid
	var grid_vbox = VBoxContainer.new()
	grid_vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid_vbox.size_flags_stretch_ratio = 4.0
	content.add_child(grid_vbox)

	var scroll = ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	grid_vbox.add_child(scroll)

	var grid = GridContainer.new()
	grid.columns = 6
	grid.add_theme_constant_override("h_separation", 6)
	grid.add_theme_constant_override("v_separation", 6)
	scroll.add_child(grid)

	var all_cards = (
		catalogue.Mascot_Holo +
		catalogue.Uncommon_Holo +
		catalogue.Full_Art_Rare_Holo +
		catalogue.Ultra_Rare_Holo +
		catalogue.Support_Holo +
		catalogue.Secret_Rare_Holo +
		catalogue.Signature_God_Rare
	)

	# Selected panel
	var selected_panel = VBoxContainer.new()
	selected_panel.custom_minimum_size = Vector2(200, 0)
	selected_panel.size_flags_horizontal = Control.SIZE_SHRINK_END
	content.add_child(selected_panel)

	var selected_title = Label.new()
	selected_title.text = "Selected Cards 0"
	selected_title.add_theme_font_size_override("font_size", 14)
	selected_panel.add_child(selected_title)

	var selected_scroll = ScrollContainer.new()
	selected_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	selected_panel.add_child(selected_scroll)

	var selected_list = VBoxContainer.new()
	selected_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	selected_scroll.add_child(selected_list)

	var add_to_deck_btn = Button.new()
	add_to_deck_btn.text = "Add to Deck"
	add_to_deck_btn.custom_minimum_size = Vector2(0, 36)
	add_to_deck_btn.pressed.connect(func():
		for card_name in pending_additions:
			for i in range(pending_additions[card_name]):
				add_card_to_deck(card_name)
		overlay.queue_free()
		refresh_deck_list()
	)
	selected_panel.add_child(add_to_deck_btn)

	# Populate grid
	for card_name in all_cards:
		if not card_database_reference.CARDS.has(card_name):
			continue
		var texture = load("res://Assets/" + card_name + ".png")
		if not texture:
			continue

		var btn = TextureButton.new()
		btn.texture_normal = texture
		btn.custom_minimum_size = Vector2 (240, 336)
		btn.ignore_texture_size = true
		btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		btn.pressed.connect(func():
			var count = pending_additions.get(card_name, 0)
			var already_in_deck = current_deck.get(card_name, 0)
			var data = card_database_reference.CARDS[card_name]
			var card_type = data[1]
			var max_copies = MAX_COPIES_VT
			if card_type == "mascot":
				max_copies = MAX_COPIES_MASCOT
			elif card_type == "support":
				max_copies = MAX_COPIES_SUPPORT
			if count + already_in_deck >= max_copies:
				return
			if get_total_deck_size() + count >= MAX_DECK_SIZE:
				return
			pending_additions[card_name] = count + 1
			for child in selected_list.get_children():
				child.queue_free()
			var total_selected = 0
			for cn in pending_additions:
				total_selected += pending_additions[cn]
				var row = HBoxContainer.new()
				var lbl = Label.new()
				lbl.text = cn + " x" + str(pending_additions[cn])
				lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				lbl.add_theme_font_size_override("font_size", 11)
				row.add_child(lbl)
				var rm = Button.new()
				rm.text = "-"
				rm.custom_minimum_size = Vector2(20, 20)
				rm.pressed.connect(func():
					if pending_additions.has(cn):
						pending_additions[cn] -= 1
						if pending_additions[cn] <= 0:
							pending_additions.erase(cn)
					# refresh
					for c in selected_list.get_children():
						c.queue_free()
					var t = 0
					for n in pending_additions:
						t += pending_additions[n]
						var r2 = HBoxContainer.new()
						var l2 = Label.new()
						l2.text = n + " x" + str(pending_additions[n])
						l2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
						l2.add_theme_font_size_override("font_size", 11)
						r2.add_child(l2)
						selected_list.add_child(r2)
					selected_title.text = "Selected Cards " + str(t)
				)
				row.add_child(rm)
				selected_list.add_child(row)
			selected_title.text = "Selected Cards " + str(total_selected)
		)
		grid.add_child(btn)

func add_card_to_deck(card_name):
	if not card_database_reference.CARDS.has(card_name):
		return
	var data = card_database_reference.CARDS[card_name]
	var card_type = data[1]

	var total = get_total_deck_size()
	if total >= MAX_DECK_SIZE:
		return

	var current_count = current_deck.get(card_name, 0)
	var max_copies = MAX_COPIES_VT
	if card_type == "mascot":
		max_copies = MAX_COPIES_MASCOT
	elif card_type == "support":
		max_copies = MAX_COPIES_SUPPORT

	if current_count >= max_copies:
		return

	if card_type == "vt" and data.size() > 5 and data[5] != "":
		var element = data[5]
		if not deck_elements.has(element):
			if deck_elements.size() >= MAX_ELEMENTS:
				return
			deck_elements[element] = 0
		deck_elements[element] += 1

	current_deck[card_name] = current_count + 1

func remove_card_from_deck(card_name):
	if not current_deck.has(card_name):
		return
	var data = card_database_reference.CARDS[card_name]
	var card_type = data[1]

	if card_type == "vt" and data.size() > 5 and data[5] != "":
		var element = data[5]
		if deck_elements.has(element):
			deck_elements[element] -= 1
			if deck_elements[element] <= 0:
				deck_elements.erase(element)

	current_deck[card_name] -= 1
	if current_deck[card_name] <= 0:
		current_deck.erase(card_name)

	refresh_deck_list()

func refresh_deck_list():
	for child in deck_list_container.get_children():
		child.queue_free()

	var vt_count = 0
	var support_count = 0
	var mascot_count = 0

	if current_deck.is_empty():
		var empty_label = Label.new()
		empty_label.text = "Your deck is empty"
		empty_label.add_theme_font_size_override("font_size", 14)
		empty_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		deck_list_container.add_child(empty_label)
	else:
		for card_name in current_deck:
			var count = current_deck[card_name]
			var data = card_database_reference.CARDS[card_name]
			var card_type = data[1]

			if card_type == "vt":
				vt_count += count
			elif card_type == "support":
				support_count += count
			elif card_type == "mascot":
				mascot_count += count

			var row = HBoxContainer.new()
			row.size_flags_horizontal = Control.SIZE_EXPAND_FILL

			var tex_rect = TextureRect.new()
			var texture = load("res://Assets/" + card_name + ".png")
			tex_rect.texture = texture
			tex_rect.custom_minimum_size = Vector2(160, 224)
			tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			tex_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			row.add_child(tex_rect)

			var label = Label.new()
			label.text = card_name + " x" + str(count)
			label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			label.add_theme_font_size_override("font_size", 13)
			row.add_child(label)

			var remove_btn = Button.new()
			remove_btn.text = "-"
			remove_btn.custom_minimum_size = Vector2(28, 28)
			remove_btn.pressed.connect(func(): remove_card_from_deck(card_name))
			row.add_child(remove_btn)

			deck_list_container.add_child(row)

	var total = get_total_deck_size()
	deck_count_label.text = str(total) + " / 50"
	vt_count_label.text = "VT: " + str(vt_count)
	support_count_label.text = "Support: " + str(support_count)
	mascot_count_label.text = "Mascot: " + str(mascot_count)

	var elem_names = []
	for e in deck_elements:
		elem_names.append(e)
	elements_label.text = "Elements: " + (", ".join(elem_names) if elem_names.size() > 0 else "none")

	var remaining = MAX_DECK_SIZE - total
	if remaining > 0:
		validation_label.text = "Deck needs " + str(remaining) + " more cards to reach 50 cards"
		validation_label.add_theme_color_override("font_color", Color(1, 0.7, 0.2))
	else:
		validation_label.text = "Deck is ready!"
		validation_label.add_theme_color_override("font_color", Color(0.3, 1, 0.3))

func get_total_deck_size():
	var total = 0
	for card_name in current_deck:
		total += current_deck[card_name]
	return total

func validate_deck():
	var total = get_total_deck_size()
	if total != MAX_DECK_SIZE:
		return false
	for card_name in current_deck:
		var data = card_database_reference.CARDS[card_name]
		if data[1] == "vt" and data[2] == 8:
			return true
	return false

func save_deck():
	#if not validate_deck():
		#validation_label.text = "Deck must be exactly 50 cards and include at least 1 PL8 VT"
		#validation_label.add_theme_color_override("font_color", Color(1, 0.3, 0.3))
		#return

	var new_deck = []
	for card_name in current_deck:
		for i in range(current_deck[card_name]):
			new_deck.append(card_name)

	GlobalDeck.player_deck = new_deck
	validation_label.text = "Deck saved!"
	validation_label.add_theme_color_override("font_color", Color(0.3, 1, 0.3))

func clear_deck():
	current_deck.clear()
	deck_elements.clear()
	refresh_deck_list()
