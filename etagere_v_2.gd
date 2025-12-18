extends StaticBody2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var v = $area_tiroir/Label_v
@onready var animation = $AnimatedSprite2D
@onready var v_teleporte = $"../in_switch/teleporte_garde_robe"


func _ready():
	v.visible = false
	animation.visible = true 
	v_teleporte.disabled = true
	  
	

func _on_area_tiroir_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true
		v.visible = true


func _on_area_tiroir_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
		v.visible = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("garde_robe_switch"):

		# TURNING ON

		if state == 0:
			state = 1

			$AnimatedSprite2D.play("tiroir_ouvre")
			$area_tiroir/son_ouvre.play()
			await get_tree().create_timer(0.8).timeout
			$"../son_tourne".play()
			$"../area_map_v1/CanvasLayer/anim_map_v".play("good_v")

			# ON logic
			v_teleporte.disabled = false
			$"../door_garde_robe/area_teleporte/CollisionShape2D".disabled = true 
			
			

		# TURNING OFF
		else:
			state = 0

			$AnimatedSprite2D.play("tiroir_ferme")
			$area_tiroir/son_ferme.play()
			
			
			$"../son_tourne".play()
			$"../area_map_v1/CanvasLayer/anim_map_v".play("not_v")
			# OFF logic
			$"../door_garde_robe/area_teleporte/CollisionShape2D".disabled = false
			v_teleporte.disabled = true
