extends Area2D



var state := 0  # 0 = OFF, 1 = ON
var player_in_area = false

func _ready() -> void:
	$Label_e.visible = false 

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true
		$Label_e.visible = true 
		
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false
		$Label_e.visible = false 

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("levier_ouvert"):
		
		if state == 0:
			state = 1
			
			$son_levier.play()
			$levier.play("levier_o")
			$"../AnimatedSprite2D".play("door_opened")
			$"../sound_door".play()
			$"../CollisionDoor".disabled = true 
			$"../player_detecter/CollisionShape2D".disabled = true 
	
		else:
			state = 0
			
			$son_levier.play()
			$levier.play("levier_f")
			$"../AnimatedSprite2D".play("door_closed")
			$"../sound_door_2".play()
			$"../CollisionDoor".disabled = false
			$"../player_detecter/CollisionShape2D".disabled = false
