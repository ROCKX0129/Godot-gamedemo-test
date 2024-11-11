extends Area2D
onready var gunnerAi=$gunnerAI
onready var Pic=$Pic
onready var MDZ = $gunnerAI/MDZ
#var enemy: Enemy = null
#signal bullet_fired(bullet, position, direction)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gunnerAi.initialize(self)
	pass # Replace with function body.

	
#func _limit_rotation():
#	if monsterinzone = ture:
#		look_at()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
