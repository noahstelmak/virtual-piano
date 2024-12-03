extends Control

const LIVRE = preload("res://src/scenes/livre/livre.tscn")
const JOGO_DA_MEMORIA = preload("res://src/scenes/jogo_da_memoria/jogo_da_memoria.tscn")

func _on_livre_pressed():
	get_tree().change_scene_to_packed(LIVRE)

func _on_jogo_memoria_pressed():
	get_tree().change_scene_to_packed(JOGO_DA_MEMORIA)

func _on_exit_button_pressed():
	get_tree().quit()
