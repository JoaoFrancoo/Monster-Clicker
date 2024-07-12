class_name DBRoute

var id : String

var name : String

var encounter_table : Array[RouteEncounter]

func _init(
		_id: String,
		_name: String,
		_encounter_table: Array[RouteEncounter],
):
	id = _id
	name = _name
	encounter_table = _encounter_table
