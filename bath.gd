extends StaticBody2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var m = $detect_player_bain/meaw
@onready var cherchechat = $detect_player_bain/CollisionShape2D


func _ready():
	m.visible = false
	cherchechat.disabled = false
	$detect_player_bain/CanvasLayer.visible = false
	 

func _on_detect_player_bain_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		m.visible = true
		player_in_area = true



func _on_detect_player_bain_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		m.visible = false
		player_in_area = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("meaw"):

		# TURNING ON

		if state == 0:
			state = 1
			
			
			
			$anim_bain.play("ouvre_bain")
			$audiorideau.play()
			await $anim_bain.animation_finished
			$detect_player_bain/CanvasLayer.visible = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$detect_player_bain/CanvasLayer.visible = false 
			$anim_bain.play("bain_ferme")
			await get_tree().create_timer(0.5).timeout
			$rideau2.play()
			

			# OFF logic
			
			cherchechat.queue_free()
			
