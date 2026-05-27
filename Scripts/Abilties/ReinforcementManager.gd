extends Node

var player_hand_reference

func _ready():
	player_hand_reference = $"../PlayerHand"

func check_trigger(trigger_type, context = null):
	var hand = player_hand_reference.player_hand
	for card in hand:
		if card.reinforcement_trigger == trigger_type:
			show_reinforcement_prompt(card, context)
			return

func show_reinforcement_prompt(card, context):
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.7)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	var label = Label.new()
	label.text = "Play " + card.card_name_key + "?"
	label.position = Vector2(700, 350)
	
	var btn_yes = Button.new()
	btn_yes.text = "Yes"
	btn_yes.position = Vector2(700, 400)
	btn_yes.pressed.connect(func():
		overlay.queue_free()
		player_hand_reference.remove_card_from_hand(card)
		get_node("../DiscardPile").add_card(card.card_name_key)
		if card.ability_script:
			card.ability_script.trigger_ability(
				get_node("../CardManager"),
				get_node("../Deck"),
				get_node("../OpponentDeck"),
				get_node("../EnemyHand"),
				get_tree(),
				context
			)
	)
	
	var btn_no = Button.new()
	btn_no.text = "No"
	btn_no.position = Vector2(750, 400)
	btn_no.pressed.connect(func():
		overlay.queue_free()
	)
	
	overlay.add_child(label)
	overlay.add_child(btn_yes)
	overlay.add_child(btn_no)
	get_tree().root.add_child(overlay)
