#define SPECIES_INFLATEABLE	"Inflatable"

/datum/species/inflateable
	name = SPECIES_INFLATEABLE
	name_plural = "inflatables"
	//primitive_form = SPECIES_MONKEY
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "A race seemingly composed of humanities discarded pooltoy equipment"
	num_alternate_languages = 3
	species_language = LANGUAGE_SOL_COMMON
	secondary_langs = list(LANGUAGE_SOL_COMMON, LANGUAGE_TERMINUS)
	name_language = null // Use the first-name last-name generator rather than a language scrambler

	min_age = 17
	max_age = 130

	economic_modifier = 7

	health_hud_intensity = 1.5

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

/datum/species/inflateable/create_organs(var/mob/living/carbon/human/H)
	H.inflatable = 1
	. = ..()
/datum/species/inflateable/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_INFLATEABLE