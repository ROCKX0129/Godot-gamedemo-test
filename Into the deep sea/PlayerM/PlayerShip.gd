extends KinematicBody2D
class_name Player
onready var Close_Zoom = $CloseZoom
onready var Float_Timer = $FloatTimer
var Float_switch = 0.25
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("player")
	Float_Timer.start()
	pass # Replace with function body.

func _physics_process(delta):
	position.y += Float_switch
	pass

func _on_FloatTimer_timeout():
	Float_switch = - Float_switch
	pass # Replace with function body.
