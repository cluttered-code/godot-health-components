class_name Projectile extends Node2D

const SPEED = 600

@onready var hit_box: HitBox2D = $HitBox2D


func _ready() -> void:
	hit_box.hurt_box_entered.connect(_on_hurt_box_entered)


func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta


func _on_hurt_box_entered(_hurt_box: HurtBox2D) -> void:
	hit_box.ignore_collisions = true
	queue_free()
