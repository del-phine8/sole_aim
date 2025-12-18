extends Area2D

@onready var collisionR = $"../r/collisonR"

func _ready() -> void:
	collisionR.disabled = false 
	 
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"../ui_R".visible = true
		collisionR.set_deferred("disabled", true)
		
		
		


func _on_body_exited(body: Node2D) -> void:
	$collisionr_2.set_deferred("disabled", true) 
