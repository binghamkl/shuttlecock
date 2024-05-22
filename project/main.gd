extends Node2D

var score : int = 0
var instruction_message = "Congrats you scored {score}

Use the up/down arrows on the keyboard to move.  
Space to start the shuttlecock.

You get 10 points each time you hit the shuttlecock, and with each bounce it speeds up."

func _ready():
	$"Directions and Score".popup()

func _process(delta):
	if !$Shuttlecock.running:
		$Shuttlecock.SetPosition($PlayerBat.position + Vector2(100, 0))


func _on_area_2d_body_entered(body):
	var lastScore = score
	$"Directions and Score".popup()
	$"Directions and Score/Directions".text = instruction_message.format({"score":lastScore})
	$Shuttlecock.start()
	score = 0
	$"Score Label/ScoreValue".text = str(score)

func _on_shuttlecock_score():
	score += 10
	$"Score Label/ScoreValue".text = str(score)
