extends Node

func trigger_ability(card_manager, deck, opponent_deck, enemy_hand, tree):
	opponent_deck.reveal_top_two()
