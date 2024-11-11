extends KinematicBody2D
class_name Enemy
var monsterPosition
#var monsterSpeed = (randi()%2+1)
var monsterSpeed = 10
onready var _animated_sprite = $AnimatedSprite
const MAX_SPEED = 100
var health = 100
var player_position
var target_position
var bulletdamege = 0
onready var player = get_parent().get_node("PlayerShip")

#signal enemy_get_hit("enemy_health")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("monster")
	pass # Replace with function body.

	
	pass
func _physics_process(delta):
	_animated_sprite.play("monster01 m")
	player_position = player.global_position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		move_and_slide(target_position * MAX_SPEED)
		look_at(player_position)
	pass

func Shooting_Upgrade():
	print("on upgrade1")


func handle_hit():
	health -= bulletdamege+20
	on_damaged()


func on_damaged():
		if health <=0:
			var current_position = position
			GlobalSignal.emit_signal("monster_dead",current_position)
			queue_free()
			print("monster_get_hit")
