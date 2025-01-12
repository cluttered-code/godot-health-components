extends Node


func _ready() -> void:
	%Damageable.pressed.connect(_on_damageable_pressed.bind(%Damageable))
	%Healable.pressed.connect(_on_healable_pressed.bind(%Healable))
	%Killable.pressed.connect(_on_killable_pressed.bind(%Killable))
	%Revivable.pressed.connect(_on_revivable_pressed.bind(%Revivable))
	
	%Damage.pressed.connect(_on_damage_pressed)
	%Heal.pressed.connect(_on_heal_pressed)
	
	$Player.health.died.connect(_on_player_died)
	$Player.health.revived.connect(_on_player_revived)


func _on_damageable_pressed(button: CheckButton):
	$Player.health.damageable = button.button_pressed


func _on_healable_pressed(button: CheckButton):
	$Player.health.healable = button.button_pressed


func _on_killable_pressed(button: CheckButton):
	$Player.health.killable = button.button_pressed


func _on_revivable_pressed(button: CheckButton):
	$Player.health.revivable = button.button_pressed


func _on_damage_pressed():
	$HitBox2D.monitoring = false
	$HitBox2D.action = HitBox2D.Action.DAMAGE
	$HitBox2D.amount = 10
	$HitBox2D.monitoring = true


func _on_heal_pressed():
	$HitBox2D.monitoring = false
	$HitBox2D.action = HitBox2D.Action.HEAL
	$HitBox2D.amount = 10
	$HitBox2D.monitoring = true


func _on_player_died(_player: Node):
	%Status.text = "Dead"


func _on_player_revived(_player: Node):
	%Status.text = "Alive"
