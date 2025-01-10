@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_custom_type("Health", "Node",
		preload("health/health.gd"),
		preload("health/health.svg"))
	
	# Load 2D components
	add_custom_type("HitBox2D", "Area2D",
		preload("2d/hit_box_2d/hit_box_2d.gd"),
		preload("2d/hit_box_2d/hit_box_2d.svg"))
	add_custom_type("HurtBox2D", "Area2D",
		preload("2d/hurt_box_2d/hurt_box_2d.gd"),
		preload("2d/hurt_box_2d/hurt_box_2d.svg"))
	
	# Load 3D components
	add_custom_type("HitBox3D", "Area3D",
		preload("3d/hit_box_3d/hit_box_3d.gd"),
		preload("3d/hit_box_3d/hit_box_3d.svg"))
	add_custom_type("HurtBox3D", "Area3D",
		preload("3d/hurt_box_3d/hurt_box_3d.gd"),
		preload("3d/hurt_box_3d/hurt_box_3d.svg"))


func _exit_tree() -> void:
	remove_custom_type("Health")
	
	# Remove 2D components
	remove_custom_type("HitBox2D")
	remove_custom_type("HurtBox2D")
	
	# Remove 3D components
	remove_custom_type("HitBox3D")
	remove_custom_type("HurtBox3D")
