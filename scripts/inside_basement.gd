extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"../StaticBody2D/bloque_sousol".call_deferred("set_disabled",false) 
		body.set_position($Marker2D2.global_position)
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 3665
			cam.limit_top = -995
			cam.limit_bottom = 1135
		await get_tree().create_timer(3.0).timeout
		$"../StaticBody2D/bloque_sousol".call_deferred("set_disabled",true)
