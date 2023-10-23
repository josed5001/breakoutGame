extends CanvasLayer

class_name UI


@onready var lifes_label = %LifesLabel
@onready var game_over_container = $GameOverContainer


func set_lifes(lifes: int):
	lifes_label.text = "Lifes: %d" % lifes


func game_over():
	game_over_container.show()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()


func _on_level_won_button_pressed():
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()
