extends Node

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	pass

func on_attach(ally_card, slot):
	if slot and slot.card_in_slot:
		slot.card_in_slot.card_pl_bonus += 1

func on_lock(ally_card, slot, deck, opponent_deck_node, discard_pile, enemy_discard_pile):
	if slot and slot.allies_in_slot.any(func(a): return a.card_name_key.begins_with("CyanideChan")):
		deck.draw_card(true)
