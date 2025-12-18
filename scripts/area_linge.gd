extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON
  
func _ready() -> void:
	$Label_i.visible = false 
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true
		$Label_i.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
		$Label_i.visible = false 



func _process(delta):
	if Input.is_action_just_pressed("linge") and $"../pile/collision_pile".disabled:
		if state == 0:
			# ON
			state = 1
			$machine_laver.play()
			$"../son_tourne".play()
			$"../cineswitch/collision_switch".disabled = false
			$"../cine_norm/collision_norm".set_deferred("disabled", true)
		else:
			# OFF
			state = 0
			$machine_laver.stop()
			$"../son_tourne".play()
			$"../cineswitch/collision_switch".set_deferred("disabled", true)
			$"../cine_norm/collision_norm".set_deferred("disabled", false)
			
			
		
	if Input.is_action_just_pressed("linge") and !$"../pile/collision_pile".disabled:
		$refu.play()
			
