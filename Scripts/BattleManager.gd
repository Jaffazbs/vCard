extends Node
const SMALL_CARD_SCALE = 0.37
const CARD_MOVE_SPEED = 0.2
var battle_timer
var empty_vt_card_slots = []

func _ready() -> void:
	battle_timer = $"../BattleTimer"
	battle_timer.one_shot = true
	battle_timer.wait_time = 1.0
	
	empty_vt_card_slots.append($"../CardSlots/EnemyCardSlot2")
	empty_vt_card_slots.append($"../CardSlots/EnemyCardSlot3")
	empty_vt_card_slots.append($"../CardSlots/EnemyCardSlot4")
	empty_vt_card_slots.append($"../CardSlots/EnemyCardSlot5")

func _on_end_turn_button_pressed() -> void:
	opponent_turn()

func opponent_turn():
	$"../EndTurnButton".disabled = true 
	$"../EndTurnButton".visible = false
	
	battle_timer.start()
	await battle_timer.timeout
	
	if not $"../OpponentDeck".opponent_deck.is_empty():
		$"../OpponentDeck".draw_card()
		battle_timer.start()
		await battle_timer.timeout
	
	if empty_vt_card_slots.size() == 0:
		end_opponent_turn()
		return
	
	await try_to_play_card_with_best_pl()
	end_opponent_turn()

func try_to_play_card_with_best_pl():
	var enemy_hand = $"../EnemyHand".enemy_hand
	if enemy_hand.size() == 0:
		end_opponent_turn()
		return
	var random_empty_vt_card_slot = empty_vt_card_slots.pick_random()
	empty_vt_card_slots.erase(random_empty_vt_card_slot)
	var card_with_best_pl = enemy_hand[0]
	for card in enemy_hand:
		if card.card_pl == 8:
			card_with_best_pl = card
	
	var tween = get_tree().create_tween()
	tween.tween_property(card_with_best_pl, "position", random_empty_vt_card_slot.global_position, CARD_MOVE_SPEED)
	var tween2 = get_tree().create_tween()
	tween2.tween_property(card_with_best_pl, "scale", Vector2(SMALL_CARD_SCALE, SMALL_CARD_SCALE), CARD_MOVE_SPEED)
	card_with_best_pl.get_node("AnimationPlayer").play("Card_Flip")
	$"../EnemyHand".remove_card_from_hand(card_with_best_pl)
	random_empty_vt_card_slot.card_in_slot = card_with_best_pl
	
	battle_timer.start()
	await battle_timer.timeout

func end_opponent_turn():
	$"../Deck".reset_draw()
	$"../EndTurnButton".visible = true
	$"../EndTurnButton".disabled = false

func unlock_all_cards():
	var slots = $"../CardSlots".get_children()
	for slot in slots:
		if "card_in_slot" in slot and slot.card_in_slot and slot.card_in_slot.has_method("unlock"):
			slot.card_in_slot.unlock()
