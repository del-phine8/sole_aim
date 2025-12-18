extends Area2D


@onready var cletrouver =$TextureRect2

func _ready():
	cletrouver.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		cletrouver.visible = true 

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		cletrouver 
		queue_free()
