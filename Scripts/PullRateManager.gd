extends Node
const CARD_SCENE_PATH = "res://Scenes/Card.tscn"
const CARD_WIDTH = 150
const PACK_Y_POSITION = 500
const PACK_SIZE = 10
var _click_pending = false
var _pack_index = 0
var catalogue = preload("res://Scripts/CardCatalogue.gd").new()
var card_scene = preload("res://Scenes/Card.tscn")
var cards_pulled = []
var center_screen_x = 0

func _ready():
	center_screen_x = get_tree().root.size.x / 2
	randomize()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_click_pending = true

func get_random_card_from_rarity(rarity):
	match rarity:
		"Mascot Holo":        return catalogue.Mascot_Holo.pick_random()
		"Uncommon Holo":      return catalogue.Uncommon_Holo.pick_random()
		"Full Art Rare Holo": return catalogue.Full_Art_Rare_Holo.pick_random()
		"Support Holo":       return catalogue.Support_Holo.pick_random()
		"Ultra Rare Holo":    return catalogue.Ultra_Rare_Holo.pick_random()
		"Secret Rare Holo":   return catalogue.Secret_Rare_Holo.pick_random()
		"Signature God Rare": return catalogue.Signature_God_Rare.pick_random()

func open_pack() -> Array:
	var pack = []
	
	# Slots 1-3: always Mascot Holo
	for i in range(3):
		pack.append({"rarity": "Mascot Holo", "card_name": get_random_card_from_rarity("Mascot Holo")})
	
	# Slots 4-6: always Uncommon Holo (pl8)
	for i in range(3):
		pack.append({"rarity": "Uncommon Holo", "card_name": get_random_card_from_rarity("Uncommon Holo")})
	
	# Slots 7-8: Support Holo or Full Art Rare Holo (world)
	# From your table: slot 7 is world ~4/10, slot 8 is world ~1/10
	for i in range(2):
		var world_chance = 0.4 if i == 0 else 0.1
		if randf() < world_chance:
			pack.append({"rarity": "Full Art Rare Holo", "card_name": get_random_card_from_rarity("Full Art Rare Holo")})
		else:
			pack.append({"rarity": "Support Holo", "card_name": get_random_card_from_rarity("Support Holo")})
	
	# Slot 9: always Ultra Rare Holo (pl9)
	pack.append({"rarity": "Ultra Rare Holo", "card_name": get_random_card_from_rarity("Ultra Rare Holo")})
	
	# Slot 10: pl8, pl10 (Secret Rare Holo), or Mascot Holo bonus
	# From your table: pl8=5/10, mascot=4/10, pl10=1/10
	var roll = randf()
	if roll < 0.5:
		pack.append({"rarity": "Uncommon Holo", "card_name": get_random_card_from_rarity("Uncommon Holo")})
	elif roll < 0.9:
		pack.append({"rarity": "Mascot Holo", "card_name": get_random_card_from_rarity("Mascot Holo")})
	else:
		pack.append({"rarity": "Secret Rare Holo", "card_name": get_random_card_from_rarity("Secret Rare Holo")})
	
	return pack

func clear_pack_display():
	for card in cards_pulled:
		card.queue_free()
	cards_pulled.clear()

func _on_open_pack_pressed():
	clear_pack_display()
	_pack_index = 0
	
	var results = open_pack()
	
	var overlay = get_tree().root.get_node("Lobby/StoreTab/PackOverlay")
	overlay.visible = true
	
	# Spawn ALL cards instantly BEFORE animation
	for i in range(PACK_SIZE):
		var result = results[i]
		var card_node = card_scene.instantiate()
		var target_node = get_tree().root.get_node("Lobby/StoreTab")
		target_node.add_child(card_node)
		card_node.modulate = Color(1, 1, 1, 1)
		card_node.visible = true
		
		var card_image_path = "res://Assets/" + result["card_name"] + ".png"
		var card_image = card_node.get_node("CardImage")
		card_image.texture = load(card_image_path)
		var tex_size = card_image.texture.get_size()
		var target = Vector2(220, 308)
		card_image.scale = target / tex_size
		card_node.card_name_key = result["card_name"]
		card_node.card_type = result["rarity"]
		card_node.position = Vector2(964, 547)
		card_node.scale = Vector2(2, 2)
		card_node.z_index = -(i + 1)
		
		if result["rarity"] in ["Ultra Rare Holo", "Full Art Rare Holo", "Secret Rare Holo", "Signature God Rare"]:
			var shader_mat = ShaderMaterial.new()
			shader_mat.shader = preload("res://Shaders/holo.gdshader")
			card_node.get_node("CardImage").material = shader_mat
		
		var card_anim = card_node.get_node("AnimationPlayer")
		card_anim.stop()
		card_anim.seek(0, true)
		cards_pulled.append(card_node)
	
	_click_pending = false
	
	# Play animation AFTER cards are already spawned
	var anim_player = get_node("../CardOpen")
	anim_player.stop()
	anim_player.play("CardOpen")
	await anim_player.animation_finished

func _process(_delta):
	if cards_pulled.size() > 0 and _click_pending and _pack_index < cards_pulled.size():
		_click_pending = false
		var card = cards_pulled[_pack_index]
		card.get_node("AnimationPlayer").play("CardPull")
		get_node("../CardSFX").play()
		
		var rarity = card.card_type
		if rarity in ["Ultra Rare Holo", "Full Art Rare Holo", "Secret Rare Holo", "Signature God Rare"]:
			var shader_mat = ShaderMaterial.new()
			shader_mat.shader = preload("res://Shaders/holo.gdshader")
			card.get_node("CardImage").material = shader_mat
		
		_pack_index += 1
