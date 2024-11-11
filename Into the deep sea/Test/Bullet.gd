extends Area2D
class_name Bullet
export (int) var speed = 10
var direction := Vector2.ZERO
onready var bullet_killer=$bulletkiller


func _ready():
	bullet_killer.start()
	self.add_to_group("Bullet")
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


func _on_bulletkiller_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Bullet_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
		pass
	
	pass # Replace with function body.
