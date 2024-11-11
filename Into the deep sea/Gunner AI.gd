extends Node2D


enum State{STANDBY,ENGAGE}
var enemy_number = 0
onready var Fire_Bullet = $FireBullet
onready var Fire_Bullet_Direction = $Firedbulletdirection
onready var Bullet_Cooldown = $BulletCooldown
export (PackedScene) var Bullet
onready var MDZ = $MDZ
var enemy :Enemy 
var actor = null
var lock_enemy
var lock_enemy_check = 0
var current_state: int = State.STANDBY setget set_state

func _ready():
	
	rotation_degrees = 0
	Bullet_Cooldown.start()
	
func set_state(new_state: int):
	if new_state ==current_state:
		return
	
	current_state = new_state
	emit_signal("state_changed",current_state)

func _physics_process(delta):
	
	
	var min_distance = 150
	var instanced_enemies = get_tree().get_nodes_in_group("monster")
	for close_enemy in instanced_enemies:
		var distance = actor.global_position.distance_to(close_enemy.global_position)
		if (distance < min_distance):
			lock_enemy = close_enemy
			set_state(State.ENGAGE)
			lock_enemy_check = 1
			pass
		
	match current_state:
			State.STANDBY:
				pass
			State.ENGAGE:
				if lock_enemy_check == 1:
						actor.rotation=actor.global_position.direction_to(instanced_enemies[0].global_position).angle()
						pass
				
				else:
					print("In the e")
				pass
			
			_:
				print("error")
				pass

func initialize(actor):
	self.actor = actor
	

func shoot():
	var bullet_instance= Bullet.instance()
	var direction = -(Fire_Bullet.global_position-Fire_Bullet_Direction.global_position).normalized()
	GlobalSignal.emit_signal("bullet_fired", bullet_instance, Fire_Bullet.global_position, direction)
	
func time_over():
	match current_state:
		State.STANDBY:
			pass
		State.ENGAGE:
			shoot()
			pass
	pass

func _on_BulletCooldown_timeout():
	time_over()



func _on_MDZ_body_exited(body:Node) -> void:
		if body && enemy == enemy:
			set_state(State.STANDBY)
			enemy_number+1
			enemy=null
