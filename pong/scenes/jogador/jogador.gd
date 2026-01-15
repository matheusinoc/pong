extends StaticBody2D

@export var jogador1: bool
var velocidade = 500


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	movimentar(delta)
	limitar_movimento()


func movimentar(delta):
	if jogador1:
		if Input.is_action_pressed("mv_cima1"):
			position.y -= velocidade * delta
		elif Input.is_action_pressed("mv_baixo1"):
			position.y += velocidade * delta
	
	else:
		if Input.is_action_pressed("mv_cima2"):
			position.y -= velocidade * delta
		elif Input.is_action_pressed("mv_baixo2"):
			position.y += velocidade * delta


func limitar_movimento():
	position.y = clamp(position.y, 65, 655)
