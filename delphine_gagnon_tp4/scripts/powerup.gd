extends Area2D

@export var nouvelle_vitesse = 150.0

func _on_body_entered(body):
	if body.is_in_group("player"):
		if "MAX_SPEED" in body:
			body.MAX_SPEED = nouvelle_vitesse
			$powersound.play()
			await $powersound.finished
			
			queue_free()
		
