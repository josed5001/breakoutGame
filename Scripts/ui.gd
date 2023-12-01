extends CanvasLayer

class_name UI


@onready var lifes_label = %LifesLabel
@onready var level_counter = $MarginContainer/HBoxContainer2/LevelCounter
@onready var game_over_container = $GameOverContainer
@onready var level_won_container = $LevelWonContainer
@onready var game_complete_container = $GameCompleteContainer

var level = LevelDefinitions.levels
# var Audios
@onready var music = $"../MusicPack/Music"
@onready var fail_audio = $"../MusicPack/FailAudio"
@onready var win_audio = $"../MusicPack/WinAudio"



func set_lifes(lifes: int):
	lifes_label.text = "Lifes: %d" % lifes

func set_level(level: int):
	level_counter.text = "Level: %d" % level


func game_over():
	game_over_container.show()
	music.stop()
	fail_audio.play()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()


func on_level_won():
	if LevelDefinitions.current_level != 3:
		level_won_container.show()
		music.stop()
		win_audio.play()
	else:
		game_complete_container.show()
		music.stop()

func _on_level_won_button_pressed():
	LevelDefinitions.current_level += 1
	get_tree().reload_current_scene()
	

func _on_game_won_button_pressed():
	LevelDefinitions.current_level = 1
	get_tree().reload_current_scene()
