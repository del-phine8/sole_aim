extends Area2D


var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var q = $Label_q
@onready var animation = $AnimatedSprite2D

func _ready():
	q.visible = false
	animation.visible = true 

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true
		q.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false
		q.visible = false


func _process(delta):
	if player_in_area and Input.is_action_just_pressed("switch_on"):

		# TURNING ON

		if state == 0:
			state = 1

			$AnimatedSprite2D.play("light_switch")
			$AudioStreamPlayer3.play()
			$son_tourne.play()

			# ON logic
			$"../sousol_switch/CollisionSwitch".disabled = false
			$"../sousol/CollisionShape2D".disabled = true 
			

		# TURNING OFF
		else:
			state = 0

			$AnimatedSprite2D.play("light_switch_allume")
			 
			$AudioStreamPlayer3.play()
			$son_tourne.play()

			# OFF logic
			
			$"../sousol_switch/CollisionSwitch".disabled = true
			$"../sousol/CollisionShape2D".disabled = false 

	

		
		

		
