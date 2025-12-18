extends Area2D

var player_in_area = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("food"):
		$food_shake.play()
