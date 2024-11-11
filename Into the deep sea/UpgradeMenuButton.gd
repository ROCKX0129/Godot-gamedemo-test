extends Area2D
var mouse_enter
onready var Upgrade_Menu = $UpGradeMenu
onready var menu = $Control/PopupMenu
signal MenuSpown(pressed)
var pressed
var onpressed = true
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if mouse_enter == true:
		_menu_response()
		rotation += 0.01
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _menu_response():
	if Input.is_action_just_pressed("mouse_clicked"):
		emit_signal("MenuSpown",pressed)
		match onpressed:
			true:
				onpressed = false
				position=position+Vector2(-300,0)
			false:
				onpressed = true
				position=position+Vector2(300,0)
				pass
pass


func _on_UpgradeMenuButton_mouse_entered():
	mouse_enter= true
	pass # Replace with function body.



func _on_UpgradeMenuButton_mouse_exited():
	mouse_enter= false
	pass # Replace with function body.
