extends Node2D
signal hovered
signal hovered_off
var card_pl_bonus = 0
var hand_position
var card_type
var card_pl 
var ability_script
var card_name_key = ""
var locked = false
var support_subtype = ""
var is_attached = false
var card_vt_type = ""
var reinforcement_trigger = ""

func lock():
	if locked:
		return
	locked = true
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 90, 0.2)

func unlock():
	if not locked:
		return
	locked = false
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 0, 0.2)

func _ready() -> void:
	if get_parent().has_method("connect_card_signals"):
		get_parent().connect_card_signals(self)

func setup(name_key: String, type: String) -> void:
	card_name_key = name_key
	card_type = type
	var path = "res://Assets/" + name_key + ".png"
	var texture = load(path)
	if texture:
		$CardImage.texture = texture
	else:
		return
	$AnimationPlayer.play("Card_Flip")

func _process(_float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if locked or not is_attached:
			return
		var mouse_pos = get_global_mouse_position()
		var card_rect = Rect2(global_position - Vector2(30, 40), Vector2(60, 80))
		if card_rect.has_point(mouse_pos) and ability_script and ability_script.has_method("on_lock"):
			var slot = find_my_slot()
			ability_script.on_lock(self, slot, get_node("/root/Main/Deck"), get_node("/root/Main/OpponentDeck"), get_node("/root/Main/DiscardPile"), get_node("/root/Main/EnemyDiscardPile"))
			lock()

func find_my_slot():
	var slots = get_node("/root/Main/CardSlots").get_children()
	for slot in slots:
		if "allies_in_slot" in slot and self in slot.allies_in_slot:
			return slot
	return null

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
