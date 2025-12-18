extends Area2D

@onready var chatmanger = $poor_cat

func _ready() -> void:
	chatmanger.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chatmanger.visible = true 
		


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		chatmanger.visible = false
