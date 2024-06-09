class_name HitBox3D extends Area3D

enum Action {DAMAGE, HEAL}

@export var action: Action = Action.DAMAGE
@export var amount: int = 0
