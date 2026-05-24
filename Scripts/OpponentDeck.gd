extends Node2D
const CARD_SCENE_PATH = "res://Scenes/EnemyCard.tscn"
const STARTING_HAND_SIZE = 7
var opponent_deck = ["Shylily.Pl10", "Shylily.Pl9", "Shylily.Pl8", "OrcaPup", "Shylily.Pl10", "Shylily.Pl9", "Shylily.Pl8", "OrcaPup", "Shylily.Pl10", "Shylily.Pl9", "Shylily.Pl8"]
var card_database_reference = ("res://Scripts/CardDataBase.gd")

func _ready() -> void:
	opponent_deck.shuffle()
	$RichTextLabel.text = str(opponent_deck.size())
	card_database_reference = preload("res://Scripts/CardDataBase.gd")
	for i in range(STARTING_HAND_SIZE):
		draw_card()

func _on_Deck_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		draw_card()

func draw_card():
	if opponent_deck.is_empty():
		return
	var card_drawn_name = opponent_deck.pop_front()
	if opponent_deck.size() == 0:
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	$RichTextLabel.text = str(opponent_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Assets/" + card_drawn_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.card_type = card_database_reference.CARDS[card_drawn_name][1]
	new_card.card_pl = card_database_reference.CARDS[card_drawn_name][2]
	new_card.card_name_key = card_drawn_name
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../EnemyHand".add_card_to_hand(new_card)

func reveal_top_two():
	if opponent_deck.size() < 2:
		return
	var card_one = opponent_deck[0]
	var card_two = opponent_deck[1]

	# Build overlay UI
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.6)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.name = "RevealOverlay"

	var card_one_rect = TextureRect.new()
	card_one_rect.texture = load("res://Assets/" + card_one + ".png")
	card_one_rect.custom_minimum_size = Vector2(220, 308)
	card_one_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	card_one_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	card_one_rect.position = Vector2(600, 200)

	var card_two_rect = TextureRect.new()
	card_two_rect.texture = load("res://Assets/" + card_two + ".png")
	card_two_rect.custom_minimum_size = Vector2(220, 308)
	card_two_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	card_two_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	card_two_rect.position = Vector2(850, 200)

	# Buttons
	var btn_both_top = Button.new()
	btn_both_top.text = "Both on Top"
	btn_both_top.position = Vector2(600, 540)
	btn_both_top.pressed.connect(func():
		get_tree().root.remove_child(overlay)
	)

	var btn_both_bottom = Button.new()
	btn_both_bottom.text = "Both on Bottom"
	btn_both_bottom.position = Vector2(750, 540)
	btn_both_bottom.pressed.connect(func():
		opponent_deck.remove_at(0)
		opponent_deck.remove_at(0)
		opponent_deck.append(card_one)
		opponent_deck.append(card_two)
		get_tree().root.remove_child(overlay)
	)

	overlay.add_child(card_one_rect)
	overlay.add_child(card_two_rect)
	overlay.add_child(btn_both_top)
	overlay.add_child(btn_both_bottom)
	get_tree().root.add_child(overlay)
	
