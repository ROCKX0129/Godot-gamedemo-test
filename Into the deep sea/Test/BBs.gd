extends Node2D
#@export var changeSpeedX:int
var init_position
var changeSpeed = 1
var turebbSpeed =(randi()%8)+ changeSpeed
var rd9 =320
var rd8 =(randi()%400)
var rd4 =(randi()%10+90)
var rd5 = 1/2+1
var rd6 = (randi()%2+1)
const BSizelimitB = 1.5
var cgiScale = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("bbs")
	init_position=position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(_delta):
	var bbSpeed:Vector2=Vector2(0,-turebbSpeed)
	position=position+bbSpeed

func _rset():
	#changeSpeed = 1+changeSpeedX
	position=Vector2(rd9-rd8,600)
	turebbSpeed = (randi()%3)+changeSpeed
	if rd6==2:
		scale /= BSizelimitB
		rd6 = 1
	if rd6==1:
		pass
	if rd6==3:
		scale *= BSizelimitB
		rd6 = 1
		
