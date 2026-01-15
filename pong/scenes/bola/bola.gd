extends Area2D


var velocidade = 500
var posicao_inicial = Vector2(640, 360)
var nova_direcao = Vector2(0,0)
var x = -1


@onready var som_barreira: AudioStreamPlayer = $SomBarreira
@onready var som_jogador: AudioStreamPlayer = $SomJogador

@onready var timer = $Timer


func _ready() -> void:
	rodar_timer()


func rodar_timer():
	velocidade = 500
	position = Vector2(-1280, 0)
	timer.start()


func _process(delta: float) -> void:
	movimentar_bola(delta)
	colidir_paredes()


func movimentar_bola(delta):
	position += nova_direcao * velocidade * delta


func colidir_paredes():
	if position.y >= 720 or position.y <= 0:
		nova_direcao.y *= -1
		
		if position.x >= 0 and position.x <= 1280:
			som_barreira.play()


func resetar_bola():
	position = posicao_inicial
	escolher_direcao_inicial()


func escolher_direcao_inicial():
	nova_direcao = Vector2(x, [-1, -0.5, 0.5, 1].pick_random())
	
	if x == -1: x = 1
	elif x == 1: x = -1


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jogadores"):
		nova_direcao.x *= -1
		som_jogador.play()
		if velocidade <= 1000: velocidade +=10


func _on_timer_timeout() -> void:
	resetar_bola()
