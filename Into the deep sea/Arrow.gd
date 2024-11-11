extends Area2D

export (int) var speed = 7
var direction := Vector2.ZERO
onready var Arrow_Particles = $ArrowParticles
onready var Arrow_killeer_timer = $ArrowKillerTimer
onready var StartPoint = $StartPoint
var current_position = position
onready var rope_time = $Timer
var arrow_wait_time
var Arrow_hits = 0
#onready var Arrowplace = $Arrowplace
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("arrow")
	arrow_wait_time = false
	GlobalSignal.emit_signal("Arrow_Position",position)
	pass # Replace with function body.

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity
		

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ArrowKillerTimer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Arrow_area_entered(area):
		for a in get_overlapping_areas():
			if a.is_in_group("resource"):
				if Arrow_hits == 0:
					direction = -direction
					Arrow_hits + 1
				
		if arrow_wait_time == true:
			for a in get_overlapping_areas():
				if a.is_in_group("ArrowShooter"):
					queue_free()
					Arrow_hits =0


func _on_Timer_timeout():
	arrow_wait_time = true
	var Aposition = global_position
	GlobalSignal.emit_signal("Arrow_Position",Aposition)
	pass # Replace with function body.
