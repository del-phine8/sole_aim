extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var two = $missing2



func _ready() -> void: 
	two.visible = false
	$ClefBox2.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true
		two.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
		two.visible = false
	

	

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("two"):

		# TURNING ON

		if state == 0 and $"../food_detector/CollisionShape2D".disabled and $"../cle_litiere/collision_litiere".disabled:
			state = 1
			two.visible = false 
			$ClefBox2.visible = true 
			$CollisionShape2D2.disabled = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$erreur_cle.play()
