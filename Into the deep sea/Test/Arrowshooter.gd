extends Area2D
onready var Fishing_line = $Line2D
onready var Kill_timer = $Timer
export (PackedScene) var Arrow
var kill_arrow
onready var Arrow_Fire = $ArrowFire
onready var Arrow_Fire_Direction = $ArrowFireDirection
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Fishing_line.add_point(position)
	self.add_to_group("ArrowShooter")
	pass # Replace with function body.
	
func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_clicked"):
		shoot()

func shoot():
	var Arrow_instance= Arrow.instance()
	var direction =-(Arrow_Fire.global_position-get_global_mouse_position()).normalized()
	GlobalSignal.emit_signal("arrow_fired", Arrow_instance, Arrow_Fire.global_position, direction)
	kill_arrow = false
	

