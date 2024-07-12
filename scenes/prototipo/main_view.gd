class_name ProtoMainView
extends VBoxContainer

@export var pokemon01 : Texture2D
@export var pokemon02 : Texture2D

@export var progress_bar : ProgressBar

var hp : float = 10

var damage : int = 1
var total_weight : int = -1
var encounter_table : Array[RouteEncounter]

@onready var data : Data = Game.ref.data

func _ready():
	progress_bar.value = hp
	initialise_route()
	update_money()
	reset()
	update_left_hp()
	
func initialise_route():
	@warning_ignore("unsafe_cast")
	encounter_table = (DBRoutes.dict["001"] as DBRoute).encounter_table
	
	total_weight = 0
	
	for encounter : RouteEncounter in encounter_table:
		total_weight += encounter.weight
		
func click_attack():
	hp -= 1
	
	if hp <= 0:
		hp = 0
		
	progress_bar.value = hp
	if hp <= 0:
		reset()
	
	update_left_hp()

func pokemon_attack():
	hp -= damage
	
	if hp <=0:
		hp = 0
		
	progress_bar.value = hp
	
	if hp == 0:
		reset()
	update_left_hp()
	
func reset():
	var rand_pokemon : int = randi_range(1, total_weight)
	var texture_path : String
	
	var counter : int = 0
	
	for encounter : RouteEncounter in encounter_table:
		counter += encounter.weight
		
		if counter >= rand_pokemon:
			@warning_ignore("unsafe_cast")
			texture_path = (DBPokemons.dict[encounter.pokemon_id] as DBPokemon).texture_path
			break
	var texture : Texture2D = load(texture_path)
	
	(get_node("%TextureRect")as TextureRect).texture = texture
	
	hp = randi_range(10,12)
	progress_bar.max_value = hp
	progress_bar.value = hp
	
	(get_node("%Right") as Label).text = "%s" %hp
	data.money += randi_range(2, 5)
	update_money()

func update_money():
	get_node("%Money").text = "Money: %s" %data.money


func update_left_hp():
	(get_node("%Left") as Label).text = "%s" %hp
	
func _on_texture_button_pressed():
	click_attack()


func _on_timer_timeout():
	pokemon_attack()
