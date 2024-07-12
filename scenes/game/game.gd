class_name Game
extends Node

static var ref : Game

func _singleton_check():
	if ref:
		free()
		return
	ref = self
	
@export var packed_user_interface : PackedScene

@export var packed_db_pokemons : PackedScene

@export var packed_db_routes : PackedScene
var data: Data

func _enter_tree():
	_singleton_check()
	data = Data.new()
	
func _ready() -> void:
	_initialise_databases()
	var user_interface : Node = packed_user_interface.instantiate()
	add_child(user_interface)

func _initialise_databases():
	var databases : Node = get_node("Databases")
	var db_pokemon : Node = packed_db_pokemons.instantiate()
	databases.add_child(db_pokemon)

	var db_routes : Node = packed_db_routes.instantiate()
	databases.add_child(db_routes)
