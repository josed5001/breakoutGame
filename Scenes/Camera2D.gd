extends Camera2D

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shakeStrength: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func apply_shake():
	shakeStrength = randomStrength

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shakeStrength > 0:
		shakeStrength = lerpf(shakeStrength, 0, shakeFade * delta)
		
		
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shakeStrength, shakeStrength),rng.randf_range(-shakeStrength, shakeStrength))
	
