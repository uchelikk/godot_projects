extends Control

@onready var ScoreLabel = $"ScoreLabel"
@onready var PlayerHP:TextureRect = $PlayerHP
const WIDTH = 37
const HEIGHT = 16

func update_score(score):
	ScoreLabel.text = "Skor: " + str(score)

func update_hp(currentHp):
	if currentHp <= 0:
		PlayerHP.visible = false
	else:
		PlayerHP.visible = true
	PlayerHP.set_size(Vector2(WIDTH*currentHp, HEIGHT))
