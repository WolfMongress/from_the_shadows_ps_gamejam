extends Node

var boss_health = 500
var player_health = 200

var boss_health_limits

var phase2_health = 1000

var beast1 = false
var beast2 = false
var beast3 = false

var beast1_ranged = false
var beast1_melee = false
var beast2_ranged = false
var beast2_melee = false
var beast3_ranged = false
var beast3_melee = false

var transformed = false
var player_turn = true
var partner_turn = false

var boss_turn = false
var boss_phase_1 = false
var boss_phase_2 = false
var boss_phase_3 = true

var phase2_which_attack : int
var phase3_which_attack : int

var boss_weakened
var boss_ultra_weakened

var boss_shield_active

var player_shield
var player_ultra_shield

var boss_poisoned
var boss_dazed
var player_dazed
var player_poisoned

var boss_poison_countdown = 0
var boss_dazed_countdown = 0
var player_poion_countdown = 0
var player_dazed_countdown = 0

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

var heal_potion = 0
var weakness_potion = 0
var defense_potion = 0

var goldenseal_amount = 5
var armoranth_amount = 5
var stinging_nettle_amount = 5
var shadow_crystal_amount = 5
var star_fragment_amount = 5
