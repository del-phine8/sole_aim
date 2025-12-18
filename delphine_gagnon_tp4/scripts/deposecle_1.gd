extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var one = $missing1



func _ready() -> void: 
	one.visible = false
	$crochet_cle.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true
		one.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
		one.visible = false
	

	

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("one"):

		# TURNING ON

		if state == 0 and $"../food_detector/CollisionShape2D".disabled and $"../areacine/collision_cle_cine".disabled:
			state = 1
			one.visible = false 
			$crochet_cle.visible = true 
			$CollisionShape2D.disabled = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$erreur_cle.play()
			 
			
			

			# OFF logic
			
			
