extends Area2D
class_name Reward
var arrowhit = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("resource")
	pass # Replace with function body.

func _physics_process(delta):
	if arrowhit == false:
		position += Vector2(0,-0.5)
		
	if arrowhit == true:
		var instanced_arrowes = get_tree().get_nodes_in_group("arrow")
		for close_arrow in instanced_arrowes:
			global_position = close_arrow.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MonsterDeadBody_area_entered(area):
	if area.is_in_group("arrow"):
		arrowhit=true
	if area.is_in_group("ArrowShooter"):
		GlobalSignal.emit_signal("Resourcelooted")
		queue_free()
