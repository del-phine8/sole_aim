extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"../ui_R".visible = true
		$"../r2/collisionr_2".set_deferred("disabled", true)
		 
		 

	


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$collisonR.set_deferred("disabled", true) 
