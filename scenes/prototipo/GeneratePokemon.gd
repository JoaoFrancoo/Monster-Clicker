class_name StateGeneratePokemon
extends AbstractState

@export var master : MainViewMaster
@export var state_manage : MainViewStateManager
func enter_state():
	reset()
	state_manage.change_state(state_manage.combat_state)
	
func process(_delta):
	pass
	
	
func leave_state():
	pass

func reset():
	var rand_pokemon : int = randi_range(1, master.total_weight)
	var texture_path : String
	
	var counter : int = 0
	
	for encounter : RouteEncounter in master.encounter_table:
		counter += encounter.weight
		
		if counter >= rand_pokemon:
			@warning_ignore("unsafe_cast")
			texture_path = (DBPokemons.dict[encounter.pokemon_id] as DBPokemon).texture_path
			break
	var texture : Texture2D = load(texture_path)
	
	(get_node("%TextureRect")as TextureRect).texture = texture
	
	master.hp = randi_range(10,12)
	master.progress_bar.max_value = master.hp
	master.progress_bar.value = master.hp
	
	(get_node("%Right") as Label).text = "%s" %master.hp
