extends Node

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	var slots = card_manager.get_node("../CardSlots").get_children()
	for slot in slots:
		if "card_in_slot" in slot and slot.card_in_slot and slot.card_in_slot.card_name_key.begins_with("Shylily"):
			slot.card_in_slot.card_pl_bonus -= 3
