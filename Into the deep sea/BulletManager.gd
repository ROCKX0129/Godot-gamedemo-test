extends Node2D
onready var Fishing_line = $Line2D
onready var Kill_timer = $Timer
onready var player = get_parent().get_node("PlayerShip/Arrowshooter")
var queue:Array
export var MAX_LENGTH :int 
var kill_arrow
var Arrowposition:Vector2


func handle_bullet_spawned(bullet: Bullet, position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = position
	bullet.set_direction(direction)

func handle_arrow_spawned(arrow, position, direction):
	add_child(arrow)
	arrow.global_position = position
	arrow.set_direction(direction)
	Kill_timer.start()
	Fishing_line.add_point(player.global_position)
	Fishing_line.add_point(Arrowposition)
	kill_arrow = false

func Arrow_Position(Aposition):
	if kill_arrow == false :
		Arrowposition = Aposition
		Fishing_line.points[1]=Arrowposition



func _on_Timer_timeout():
	kill_arrow = true
	Fishing_line.clear_points()
	pass # Replace with function body.
