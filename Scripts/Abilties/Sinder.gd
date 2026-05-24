extends Node
func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	card_manager.start_target_selection(func(target_card):
		if target_card.card_pl >= 9:
			deck.draw_card(true)
		target_card.card_pl_bonus += 1
	)
