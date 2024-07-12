class_name MainViewMaster
extends Node

@export var progress_bar : ProgressBar

var hp : float = 10

var damage : int = 1
var total_weight : int = -1
var encounter_table : Array[RouteEncounter]

@onready var data : Data = Game.ref.data

func update_left_hp():
	(get_node("%Left") as Label).text = "%s" %hp
