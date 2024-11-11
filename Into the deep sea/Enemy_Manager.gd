extends Node
const SPAWN_RADIUS = 350
var enemy_number = 5
export (PackedScene) var basic_enemy_scene
export (PackedScene) var dead_body

onready var timer=$SpawnTimer

func _ready():
	 timer.start()

func monster_dead(position):
	var enemy_dead_body = dead_body.instance()
	get_parent().add_child(enemy_dead_body)
	enemy_dead_body.global_position = position
	pass
func _on_SpawnTimer_timeout():	
	#var player = get_tree().get_first_node_in_group("player")
	#if player == null:
	#	return
		
	var random_direction = Vector2.RIGHT.rotated(rand_range(0,TAU))
	#var spawn_position = player.global_position+(random_direction * SPAWN_RADIUS)
	var spawn_position = random_direction * SPAWN_RADIUS
	
	var enemy = basic_enemy_scene.instance()
	get_parent().add_child(enemy)
	enemy.global_position = spawn_position
	
		#print(enemy_number)

	pass # Replace with function body.
