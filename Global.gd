extends Node

var boss_health = 500
var player_health = 200

var beast1 = false
var beast2 = false
var beast3 = false

var transformed = false
var player_turn = true
var partner_turn = false

var boss_turn = false
var boss_phase_1 = true

var boss_weakened
var boss_ultra_weakened
var player_shield
var player_ultra_shield

var three_turn_countdown = 0

var primary_ui_state = false

var bear_bear = false
var bear_cat = false
var bear_elephant = false

var cat_bear = false
var cat_cat = true
var cat_elephant = false

var elephant_bear = false
var elephant_cat = false
var elephant_elephant = false

var heal_potion = false
var weakness_potion = false
var defense_potion = false

var goldenseal_amount = 5
var armoranth_amount = 5
var stinging_nettle_amount = 5
var shadow_crystal_amount = 5
var star_fragment_amount = 5
