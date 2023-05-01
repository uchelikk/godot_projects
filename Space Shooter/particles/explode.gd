extends GPUParticles2D

func _ready():
	start()

func start():
	emitting = true
	$Sfx.play()
