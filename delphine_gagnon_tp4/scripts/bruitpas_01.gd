extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$CollisionShape2D.set_deferred("disabled", true)
		$"../bruitpas_loin".play()
		await $"../bruitpas_loin".finished
		$"../bruitportev2".play()
		$"../message_cuisine/collision_cuisine_message".set_deferred("disabled", true)
		
		queue_free()
