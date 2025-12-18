extends Area2D

@onready var locked = $cuisine_img

func _ready() -> void:
	locked.visible = false 
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		locked.visible = true 
		
		


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		locked.visible = false 
