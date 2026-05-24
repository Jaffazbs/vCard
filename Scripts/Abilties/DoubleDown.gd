extends Node

var targets_selected = 0

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	targets_selected = 0
	select_next(card_manager)

func select_next(card_manager):
	if targets_selected >= 2:
		return
	card_manager.start_target_selection(func(target_card):
		target_card.card_pl_bonus += 1
		targets_selected += 1
		select_next(card_manager)
)
