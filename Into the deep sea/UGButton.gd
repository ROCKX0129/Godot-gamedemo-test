extends Button

var mouse_enter
# Declare member variables here. Examples:
var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if mouse_enter == true:
		rotation = 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_UpgradeMenuButton_mouse_entered():
	mouse_enter= true
	pass # Replace with function body.



func _on_UpgradeMenuButton_mouse_exited():
	mouse_enter= false
	pass # Replace with function body.
