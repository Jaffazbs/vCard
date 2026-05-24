extends Node2D

const CARD_SCENE_PATH = "res://Scenes/EnemyCard.tscn"
const CARD_WIDTH = 150
const HAND_Y_POSITION = 0


var enemy_hand = []
var center_screen_x


func _ready() -> void:
	center_screen_x = get_viewport().size.x / 2

func reveal_hand():
	for card in enemy_hand:
		card.get_node("AnimationPlayer").play("Card_Flip")

func hide_hand():
	for card in enemy_hand:
		card.get_node("AnimationPlayer").play_backwards("Card_Flip")

func add_card_to_hand(card):
	if card not in enemy_hand:
		var card_image = card.get_node("CardImage")
		var tex_size = card_image.texture.get_size()
		card_image.scale = Vector2(220, 308) / tex_size
		enemy_hand.insert(0, card)
		update_hand_positions()
	else:
		animate_card_to_position(card, card.hand_position)


func update_hand_positions():
	for i in range(enemy_hand.size()):
		var new_position = Vector2(calculate_card_position(i), HAND_Y_POSITION)
		var card = enemy_hand[i]
		card.hand_position = new_position
		animate_card_to_position(card, new_position)


func calculate_card_position(index):
	var total_width = (enemy_hand.size() -1) * CARD_WIDTH
	var x_offset = center_screen_x + index * CARD_WIDTH - total_width / 2
	return x_offset


func animate_card_to_position(card, new_position):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", new_position, 0.1)


func remove_card_from_hand(card):
	if card in enemy_hand:
		enemy_hand.erase(card)
		update_hand_positions()
