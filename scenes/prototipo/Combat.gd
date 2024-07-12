class_name StateCombat
extends AbstractState

@export var master : MainViewMaster
@export var state_manage : MainViewStateManager
@export var combat_time : Timer
@export var texture_button : TextureButton
func enter_state():
	combat_time.start()
	texture_button.disabled = false
func process(_delta : float):
	pass

func leave_state():
	combat_time.stop()
	texture_button.disabled = true
	
func pokemon_attack():
	master.hp -= master.damage
	
	if master.hp <=0:
		master.hp = 0
		
	master.progress_bar.value = master.hp
	
	if master.hp == 0:
		pokemon_defeated()
	master.update_left_hp()
		
func click_attack():
	master.hp -= 1
	
	if master.hp <= 0:
		master.hp = 0
		
	master.progress_bar.value = master.hp
	if master.hp <= 0:
		pokemon_defeated()
	
	master.update_left_hp()
	
func pokemon_defeated():
	Game.ref.data.money += randi_range(2, 5)
	state_manage.change_state(state_manage.generate_pokemon_state)

func _on_combat_timer_timeout():
	pokemon_attack()


func _on_texture_button_pressed():
	click_attack()
