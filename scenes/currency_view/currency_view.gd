class_name CurrencyView
extends VBoxContainer

@export var money_label : Label
@onready var data = Game.ref.data

func _process(_delta: float):
	get_node("%Money").text = "Money: %s" %data.money
