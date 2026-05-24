extends Node

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	pass

func on_lock(ally_card, slot, deck, opponent_deck_node, discard_pile, enemy_discard_pile):
	if slot and slot.card_in_slot:
		var vt = slot.card_in_slot
		var total_pl = vt.card_pl + vt.card_pl_bonus
		if total_pl >= 11:
			deck.draw_card(true)
