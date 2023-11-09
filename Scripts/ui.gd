extends CanvasLayer

class_name UI


@onready var lifes_label = %LifesLabel
@onready var game_over_container = $GameOverContainer
@onready var level_won_container = $LevelWonContainer
@onready var music = $"../MusicPack/Music"
@onready var fail_audio = $"../MusicPack/FailAudio"



func set_lifes(lifes: int):
	lifes_label.text = "Lifes: %d" % lifes


func game_over():
	game_over_container.show()
	music.stop()
	fail_audio.play()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()


func on_level_won():
	level_won_container.show()

func _on_level_won_button_pressed():
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()
