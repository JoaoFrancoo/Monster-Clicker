class_name  StateEnterRoute
extends AbstractState

@export var master : MainViewMaster
@export var state_manager : MainViewStateManager

func enter_state():
	initialise_route()
	state_manager.change_state(state_manager.generate_pokemon_state)
	
func _process(delta):
	pass

func leave_state():
	pass
func initialise_route():
	var route_id : String = Game.ref.data.current_route
	master.encounter_table = (DBRoutes.dict[route_id] as DBRoute).encounter_table
	
	master.total_weight = 0
	
	for encounter : RouteEncounter in master.encounter_table:
		master.total_weight += encounter.weight
