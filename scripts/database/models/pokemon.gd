class_name DBPokemon

var id : String

var name : String

var attack : int
var texture_path : String

func _init(_id : String, _name : String, _attack : int, _texture_path : String):
	id = _id
	name = _name
	attack = _attack
	texture_path = _texture_path
