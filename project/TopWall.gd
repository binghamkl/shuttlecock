extends StaticBody2D


func bounce():
	$WallFlashAnimation.active = true
	$WallFlashAnimation.play("WallFlash")
