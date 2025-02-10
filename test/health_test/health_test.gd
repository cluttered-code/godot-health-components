# GdUnit generated TestSuite
class_name HealthTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://addons/health_hitbox_hurtbox/health/health.gd'

var health: Health

func before_test() -> void:
	health = auto_free(Health.new())
	add_child(health)


func test_defaults() -> void:
	assert_int(health.current).is_equal(health.DEFAULT_MAX)
	assert_int(health.max).is_equal(health.DEFAULT_MAX)


func test_is_dead() -> void:
	assert_bool(health.is_dead()).is_false()
	health.damage(health.max)
	assert_bool(health.is_dead()).is_true()


func test_is_full() -> void:
	assert_bool(health.is_full()).is_true()
	health.damage(1)
	assert_bool(health.is_full()).is_false()


func test_percent() -> void:
	assert_float(health.percent()).is_equal(1.0)
	health.damage(health.current / 2)
	assert_float(health.percent()).is_equal(0.5)
	health.damage(health.current / 2)
	assert_float(health.percent()).is_equal(0.25)
	health.damage(health.max)
	assert_float(health.percent()).is_equal(0.0)
	
	health.current = 1
	health.max = 3
	assert_float(health.percent()).is_equal_approx(0.333333, 0.000001)
