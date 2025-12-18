extends StaticBody2D


var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var a = $Label_A
@onready var switchbain = $"../door_salle_bain/area_teleporte_switch/CollisionShape2D"


func _ready():
	a.visible = false
	switchbain.disabled = true 
	 

func _on_player_detector_sink_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		a.visible = true
		player_in_area = true



func _on_player_detector_sink_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		a.visible = false
		player_in_area = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("lavabo"):

		# TURNING ON

		if state == 0:
			state = 1
			
			$lavabo_ouvre.play()
			await $lavabo_ouvre.finished 
			$anim_sink.play("eau_ouvre")
			$son_eau.play()
			$"../son_tourne".play()
			$"../apparition_A/a/AnimatedSprite2D".play("good_a")
			$anim_sink.play("eau_coule")
			
			

			# ON logic
			switchbain.disabled = false
			$"../door_salle_bain/area_teleporte_bain/teleporte_bain".disabled = true 
			

		# TURNING OFF
		else:
			state = 0
			$son_eau.stop() 
			$son_eau_ferme.play()
			$lavabo_ferme.play()
			$"../son_tourne".play()
			$"../apparition_A/a/AnimatedSprite2D".play("not_a")
			$anim_sink.play("eau_ferme")
			

			# OFF logic
			
			switchbain.disabled = true
			$"../door_salle_bain/area_teleporte_bain/teleporte_bain".disabled = false
	
