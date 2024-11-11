extends Node2D

onready var bullet_manager = $BulletManager
onready var player = $PlayerShip/Guner/gunnerAI
onready var Background_Animetion = $BackgroundAnimetion
onready var UpGrade_Menu = $Menu/UpGradeMenu
onready var Upgrade_Menu_Button = $UpgradeMenuButton
onready var Game_music = $GameMusic
onready var Enemy_Manager = $EnemyManager
onready var Arrow_Shooter = $PlayerShip/Arrowshooter



func _ready():
	#Game_music.play()
	GlobalSignal.connect("monster_dead",Enemy_Manager,"monster_dead")
	GlobalSignal.connect("bullet_fired", bullet_manager,"handle_bullet_spawned")
	GlobalSignal.connect("arrow_fired", bullet_manager,"handle_arrow_spawned")
	GlobalSignal.connect("Arrow_Position", bullet_manager,"Arrow_Position")
	#GlobalSignal.connect("Arrow_Position", Arrow_Shooter,"Arrow_Position")
func _physics_process(delta):
	Background_Animetion.play("Background")
