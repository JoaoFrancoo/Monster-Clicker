class_name StateLeaveRoute
extends AbstractState

@export var master : MainViewMaster
@export var state_manager : MainViewStateManager

func enter_state():
	clear_route()
	state_manager.change_state(state_manager.enter_router_state)
	
func clear_route():
	master.total_weight = -1
	master.encounter_table = []
		
