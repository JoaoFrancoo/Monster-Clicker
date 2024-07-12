extends Node

class_name DBRoutes

static var ref : DBRoutes
static var dict : Dictionary = {}


func _enter_tree():
	if ref:
		free()
		return
	ref = self

func _ready():
	if "001" not in dict:
		dict["001"] = DBRoute.new(
			"001",
			"Route 1",
			[
				RouteEncounter.new("0001:01", 2),
				RouteEncounter.new("0115:01", 6),
				RouteEncounter.new("0161:01", 3),
				RouteEncounter.new("0162:01", 1)
			]
		)
