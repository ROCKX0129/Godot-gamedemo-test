extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	for a in get_overlapping_areas():
		if a.is_in_group("bbs"):
			a._rset()
