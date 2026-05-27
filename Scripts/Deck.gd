extends Node2D
const CARD_SCENE_PATH = "res://Scenes/Card.tscn"
const STARTING_HAND_SIZE = 7
var player_deck = ["Sinder.Pl10", "Sinder.Pl9", "Sinder.Pl8", "PyroPup", "Sinder.Pl10", "Sinder.Pl9", "Sinder.Pl8", "PyroPup", "Sinder.Pl10", "Sinder.Pl9", "Sinder.Pl8", "SnackCat", "SnackCat", "SnackCat"]
var card_database_reference = ("res://Scripts/CardDataBase.gd")
var drawn_card_this_turn = false

func _ready() -> void:
	player_deck.shuffle()
	$RichTextLabel.text = str(player_deck.size())
	card_database_reference = preload("res://Scripts/CardDataBase.gd")
	for i in range(STARTING_HAND_SIZE):
		draw_card() 
		drawn_card_this_turn = false
	drawn_card_this_turn = true

func _on_Deck_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		draw_card() 

func draw_specific_card(card_name):
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Assets/" + card_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.card_type = card_database_reference.CARDS[card_name][1]
	new_card.card_pl = card_database_reference.CARDS[card_name][2]
	new_card.card_name_key = card_name
	var ability_path = card_database_reference.CARDS[card_name][3]
	if ability_path:
		new_card.ability_script = load(ability_path).new()
	if card_database_reference.CARDS[card_name].size() > 5:
		new_card.card_vt_type = card_database_reference.CARDS[card_name][5]
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card)
	new_card.get_node("AnimationPlayer").play("Card_Flip")
	$RichTextLabel.text = str(player_deck.size())

func draw_card(ignore_limit = false):
	if drawn_card_this_turn and not ignore_limit:
		return
	
	if not ignore_limit:
		drawn_card_this_turn = true
	if player_deck.is_empty():
		return
	var card_drawn_name = player_deck[0]
	player_deck.erase(card_drawn_name)
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Assets/" + card_drawn_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.card_type = card_database_reference.CARDS[card_drawn_name][1]
	new_card.card_pl = card_database_reference.CARDS[card_drawn_name][2]
	new_card.card_name_key = card_drawn_name
	var new_card_ability_script_path = card_database_reference.CARDS[card_drawn_name][3]
	if new_card_ability_script_path:
		new_card.ability_script = load(new_card_ability_script_path).new()
	if card_database_reference.CARDS[card_drawn_name].size() > 5:
		new_card.card_vt_type = card_database_reference.CARDS[card_drawn_name][5]
		new_card.support_subtype = card_database_reference.CARDS[card_drawn_name][5]
	if card_database_reference.CARDS[card_drawn_name].size() > 6:
		new_card.reinforcement_trigger = card_database_reference.CARDS[card_drawn_name][6]
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card)
	new_card.get_node("AnimationPlayer").play("Card_Flip")
func reset_draw():
	drawn_card_this_turn = false
