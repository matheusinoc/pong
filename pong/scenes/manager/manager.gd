extends Node2D

@onready var bola = $"../Bola"

@onready var somGol: AudioStreamPlayer = $AudioStreamPlayer

var pont_jogador1: int = 0
var pont_jogador2: int = 0

@onready var texto_pont_jogador1: Label = $"../UI/PainelDePontuacao/TextPontJ1"
@onready var texto_pont_jogador2: Label = $"../UI/PainelDePontuacao/TextPontJ2"


func _process(delta: float) -> void:
	receber_input()


func receber_input():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()


func _on_gol_1_area_entered(area: Area2D) -> void:
	somGol.play()
	pont_jogador2 += 1
	texto_pont_jogador2.text = str(pont_jogador2)
	bola.rodar_timer()


func _on_gol_2_area_entered(area: Area2D) -> void:
	somGol.play()
	pont_jogador1 += 1
	texto_pont_jogador1.text = str(pont_jogador1)
	bola.rodar_timer()
