extends Area2D
@onready var game_managment: Node = %GameManagment
func _on_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		game_managment.add_point()
		queue_free()
