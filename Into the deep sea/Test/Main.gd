extends Node

#export var mob_scene: PackedScene
var score
var bbNum = 1
var limitBbnum = 25
onready var Spawn_Timer = $SpawnTimer
#const Bb_Scene = "MBB.tscn" as String

# Called when the node enters the scene tree for the first time.
#func _ready():
	#BBs.reset

func _ready():
	Bbs._rset()
	Spawn_Timer.start()
	pass
	
	#pass # Replace with function body.
#func _physics_process(delta):
	#	if bbNum < limitBbnum:
	#		_spawn_bb()
	#		bbNum += 1
			#if limitBbnum > 25:
			#	limitBbnum -=3


func _spawn_bb():
	var sbb = preload("res://Test/BB.tscn").instance()
	add_child(sbb)


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_SpawnTimer_timeout():
	if bbNum < limitBbnum:
		_spawn_bb()
		bbNum += 1
	pass # Replace with function body.
