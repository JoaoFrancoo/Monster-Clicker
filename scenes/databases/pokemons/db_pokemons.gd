class_name DBPokemons
extends Node

static var ref : DBPokemons

func _enter_tree():
	if ref:
		free()
		return
	
	ref = self

static var dict : Dictionary

func _ready():
	# Initialize the dictionary with Pokémon data
	dict["0001:01"] = DBPokemon.new(
		 "0001:01",
		"Bulbasaur",
		 1,
		"res://assets/Pokemon/Gen1/bulbasaur.png",
	)
	
	dict["0002:01"] = DBPokemon.new(
		"0002:01",
		 "Ivysaur",
		2,
		"res://assets/Pokemon/Gen1/ivysaur.png",
	)
	dict["0003:01"] = DBPokemon.new(
		"0003:01",
		"Venasaur",
		3,
		"res://assets/Pokemon/Gen1/venusaur.png",
	)
	dict["0115:01"] = DBPokemon.new(
		"0115:01",
		"Kangaskhan",
		2,
		"res://assets/Pokemon/Gen1/kangaskhan.png",
	)
	dict["0128:01"] = DBPokemon.new(
		"0128:01",
		"Tauros",
		4,
		"res://assets/Pokemon/Gen1/tauros.png",
	)
	dict["0161:01"] = DBPokemon.new(
		"0161:01",
		"Sentret",
		1,
		"res://assets/Pokemon/Gen2/sentret.png",
	)
	dict["0162:01"] = DBPokemon.new(
		"0162:01",
		"Furret",
		10,
		"res://assets/Pokemon/Gen2/furret.png",
	)
	dict["0227:01"] = DBPokemon.new(
		 "0227:01",
		"Skarmory",
		3,
		"res://assets/Pokemon/Gen3/skarmory.png",
	)
