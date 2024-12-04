extends Control

const LIVRE = preload("res://src/scenes/livre/instrucoes.tscn")
const JOGO_DA_MEMORIA = preload("res://src/scenes/jogo_da_memoria/instrucoes.tscn")
const PIANO_HERO = preload("res://src/scenes/piano_hero/instrucoes.tscn")

func _on_livre_pressed():
	get_tree().change_scene_to_packed(LIVRE)

func _on_piano_hero_pressed():
	get_tree().change_scene_to_packed(PIANO_HERO) 

func _on_jogo_memoria_pressed():
	get_tree().change_scene_to_packed(JOGO_DA_MEMORIA)

func _on_exit_button_pressed():
	get_tree().quit()
