class_name Projectile extends HitBox2D

const SPEED = 600

func _ready() -> void:
	super()
	
	hurt_box_entered.connect(_on_hurt_box_entered)


func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta


func _on_hurt_box_entered(_hurt_box: HurtBox2D) -> void:
	ignore_collisions = true
	queue_free()
