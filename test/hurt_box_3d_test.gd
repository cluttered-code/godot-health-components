class_name HurtBox3DTest extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var mock_health: Health
var hurt_box: HurtBox3D

func before_test() -> void:
	mock_health = auto_free(mock(Health))
	hurt_box = auto_free(HurtBox3D.new())
	hurt_box.health = mock_health
	add_child(hurt_box)


func test_damage() -> void:
	hurt_box.damage(10)
	
	verify(mock_health, 1).damage(10)


func test_damage_modifier() -> void:
	hurt_box.damage_multiplier = 1.5
	hurt_box.damage(10)
	
	verify(mock_health, 1).damage(15)


func test_damage_no_health() -> void:
	hurt_box.health = null
	
	await assert_error(func(): hurt_box.damage(10))\
			.is_push_error("%s is missing a 'Health' component" % hurt_box)
	
	verify_no_interactions(mock_health)


func test_heal() -> void:
	hurt_box.heal(10)
	
	verify(mock_health, 1).heal(10)


func test_heal_modifier() -> void:
	hurt_box.heal_multiplier = 2.4
	hurt_box.heal(10)
	
	verify(mock_health, 1).heal(24)


func test_heal_no_health() -> void:
	hurt_box.health = null
	
	await assert_error(func(): hurt_box.heal(10))\
			.is_push_error("%s is missing a 'Health' component" % hurt_box)
	
	verify_no_interactions(mock_health)


func test_on_entered_damage() -> void:
	var hit_box: HitBox3D = auto_free(HitBox3D.new())
	hit_box.action = HitBox3D.Action.DAMAGE
	hit_box.amount = 10
	
	hurt_box._on_area_entered(hit_box)
	
	verify(mock_health, 1).damage(10)


func test_on_entered_heal() -> void:
	var hit_box: HitBox3D = auto_free(HitBox3D.new())
	hit_box.action = HitBox3D.Action.HEAL
	hit_box.amount = 10
	
	hurt_box._on_area_entered(hit_box)
	
	verify(mock_health, 1).heal(10)


func test_on_entered_not_hit_box_3d() -> void:
	var area = auto_free(Area3D.new())
	
	hurt_box._on_area_entered(area)
	
	verify(mock_health, 0).damage(any_int())
	verify(mock_health, 0).heal(any_int())
