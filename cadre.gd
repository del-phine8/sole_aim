extends Area2D
var player_in_area = false



	
func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false
		
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("levier_ouvert"):
		$"../CanvasLayer2".visible = true 
