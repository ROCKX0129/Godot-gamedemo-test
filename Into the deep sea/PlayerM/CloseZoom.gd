extends Area2D
var Gunner: GunnerAi
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	for a in get_overlapping_areas():
		if a.is_in_group("monster"):
			emit_signal("State""ENGAGE")
			pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
