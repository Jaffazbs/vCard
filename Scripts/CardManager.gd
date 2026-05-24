extends Node2D

const COLLISION_MASK_CARD = 1 
const COLLISION_MASK_CARD_SLOT = 2
const DEFAULT_CARD_SCALE = 0.7
const CARD_BIGGER_SCALE = 0.75

var card_database_reference = preload("res://Scripts/CardDataBase.gd")
var screen_size
var card_being_dragged
var is_hovering_on_card 
var player_hand_reference 
var played_vt_card_this_turn = false
var card_in_slot
var selecting_target = false
var selection_callback

func _ready() -> void:
	$"../CardSlots".visible = false
	screen_size = get_viewport_rect().size
	player_hand_reference = $"../PlayerHand"
	$"../InputManager".connect("left_mouse_button_released", on_left_click_released)


func _process(_delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x), 
			clamp(mouse_pos.y, 0, screen_size.y))


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if selecting_target:
				var mouse_pos = get_global_mouse_position()
				var slots = get_node("../CardSlots").get_children()
				for slot in slots:
					if "card_in_slot" in slot and slot.card_in_slot and slot.card_in_slot is Node2D:
						var card = slot.card_in_slot
						if card.card_type == "vt":
							var card_rect = Rect2(card.global_position - Vector2(50, 70), Vector2(100, 140))
							if card_rect.has_point(mouse_pos):
								selecting_target = false
								selection_callback.call(card)
								break
				return
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			on_left_click_released()

func start_target_selection(callback):
	selecting_target = true
	selection_callback = callback

func start_drag(Card):
	card_being_dragged = Card
	Card.scale = Vector2(DEFAULT_CARD_SCALE, DEFAULT_CARD_SCALE)
	$"../CardSlots".visible = true
	var description = card_database_reference.CARDS[Card.card_name_key][4]
	get_node("../InfoSideCard").show_card_info(Card.get_node("CardImage").texture, description)


func finish_drag():
	selecting_target = false
	var card_slot_found = raycast_check_for_card_slot()
	$"../CardSlots".visible = false

	if card_being_dragged == null:
		return

	var valid_drop := false
	if card_slot_found \
	and card_being_dragged.card_type in card_slot_found.card_slot_type \
	and (
		("vt" in card_slot_found.card_slot_type
		and not card_slot_found.card_in_slot
		and card_being_dragged.card_pl == 8)
		or ("mascot" in card_slot_found.card_slot_type  
		and not card_slot_found.card_in_slot)
		or ("support" in card_slot_found.card_slot_type
		and card_being_dragged.card_type == "support"
		and card_being_dragged.support_subtype != "ally"
		and not card_slot_found.card_in_slot)
		or ("vt" not in card_slot_found.card_slot_type
		and "mascot" not in card_slot_found.card_slot_type
		and "support" not in card_slot_found.card_slot_type
		and not card_slot_found.card_in_slot)
		or (card_slot_found.card_in_slot
		and card_slot_found.card_in_slot.card_pl == card_being_dragged.card_pl - 1)
	):
		valid_drop = true

	if valid_drop:
		player_hand_reference.remove_card_from_hand(card_being_dragged)
		card_being_dragged.global_position = card_slot_found.global_position
		
		var parent_node = card_being_dragged.get_parent()
		parent_node.move_child(card_being_dragged, parent_node.get_child_count() - 1)
		var tween = create_tween()
		tween.tween_property(card_being_dragged, "scale", Vector2(0.37, 0.37), 0.1)
		card_being_dragged.get_node("Area2D/CollisionShape2D").disabled = true
		
		var card_image = card_being_dragged.get_node("CardImage")
		var tex_size = card_image.texture.get_size()
		card_image.scale = Vector2(220, 308) / tex_size
		
		var was_evolution = card_slot_found.card_in_slot != null
		var inherited_bonus = 0
		if was_evolution:
			inherited_bonus = card_slot_found.card_in_slot.card_pl_bonus
		card_slot_found.card_in_slot = card_being_dragged
		card_being_dragged.card_pl_bonus += inherited_bonus
		
		if was_evolution:
			if card_being_dragged.card_pl == 9:
				get_node("../Deck").draw_card(true)
			elif card_being_dragged.card_pl == 10:
				get_node("../Deck").draw_card(true)
				get_node("../Deck").draw_card(true)
		
		if card_being_dragged.card_type == "vt":
			played_vt_card_this_turn = true
			if card_being_dragged.ability_script:
				card_being_dragged.ability_script.trigger_ability(self, get_node("../Deck"), get_node("../OpponentDeck"), get_node("../EnemyHand"), get_tree())
		elif card_being_dragged.card_type == "mascot":
			pass
		else:
			if card_being_dragged.ability_script:
				card_being_dragged.ability_script.trigger_ability(self, get_node("../Deck"), get_node("../OpponentDeck"), get_node("../EnemyHand"), get_tree())

	elif card_slot_found \
		and card_being_dragged.support_subtype == "ally" \
		and card_slot_found.card_in_slot:
		player_hand_reference.remove_card_from_hand(card_being_dragged)
		card_slot_found.allies_in_slot.append(card_being_dragged)
		card_being_dragged.is_attached = true
		card_being_dragged.get_node("Area2D/CollisionShape2D").disabled = true
		card_being_dragged.disconnect("hovered", on_hovered_over_card)
		card_being_dragged.disconnect("hovered_off", on_hovered_off_card)
		var ally_count = card_slot_found.allies_in_slot.size()
		var attach_pos = card_slot_found.global_position + Vector2(60 * ally_count, 0)
		var ally_tween = create_tween()
		ally_tween.tween_property(card_being_dragged, "global_position", attach_pos, 0.1)
		ally_tween.tween_property(card_being_dragged, "scale", Vector2(0.25, 0.25), 0.1)
		if card_being_dragged.ability_script and card_being_dragged.ability_script.has_method("on_attach"):
			card_being_dragged.ability_script.on_attach(card_being_dragged, card_slot_found)
	else:
		card_being_dragged.scale = Vector2(0.7, 0.7)
		player_hand_reference.add_card_to_hand(card_being_dragged)

	get_node("../InfoSideCard").hide_card_info()
	card_being_dragged = null

func connect_card_signals(Card):
	Card.connect("hovered", on_hovered_over_card)
	Card.connect("hovered_off", on_hovered_off_card)

func on_left_click_released():
	if card_being_dragged:
		finish_drag()


func on_hovered_over_card(Card):
	if !is_hovering_on_card:
		is_hovering_on_card = true
		highlight_card(Card, true)


func on_hovered_off_card(Card):
	if !card_being_dragged:
		highlight_card(Card, false)
		var new_card_hovered = raycast_check_for_card()
		if new_card_hovered: 
			highlight_card(new_card_hovered, true)
		else:
			is_hovering_on_card = false


func highlight_card(Card, hovered):
	if hovered:
		Card.scale = Vector2(CARD_BIGGER_SCALE, CARD_BIGGER_SCALE)
		Card.z_index = 2
	else:
		Card.scale = Vector2(DEFAULT_CARD_SCALE, DEFAULT_CARD_SCALE)
		Card.z_index = 1


func raycast_check_for_card_slot():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD_SLOT
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null


func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return get_card_with_highest_z_index(result)
	return null


func get_card_with_highest_z_index(Cards):
	var highest_z_card = Cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index
	for i in range(1, Cards.size()):
		var current_card = Cards[i].collider.get_parent()
		if current_card.z_index > highest_z_index:
			highest_z_card = current_card
			highest_z_index = current_card.z_index
	return highest_z_card
