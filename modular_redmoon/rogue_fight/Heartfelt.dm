/datum/job/roguetown/captain/ctf_north
	title = "Heartfelt Knight Captain"
	total_positions = 1
	spawn_positions = 1

/datum/job/roguetown/captain/ctf_north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf/north)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/captain/ctf_north/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE)

/datum/job/roguetown/knight/ctf_north
	title = "Heartfelt Knight"
	total_positions = 5
	spawn_positions = 5

/datum/job/roguetown/knight/ctf_north/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		L.mind.add_antag_datum(/datum/antagonist/ctf/north)
		var/mob/living/carbon/human/H = L
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/templar/ctf_north
	title = "Heartfelt Templar"
	total_positions = 5
	spawn_positions = 5

/datum/job/roguetown/templar/ctf_north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf/north)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/magician/ctf_north
	title = "Heartfelt Caster"
	total_positions = 1
	spawn_positions = 1

/datum/job/roguetown/magician/ctf_north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf/north)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/manorguard/ctf_north
	title = "Heartfelt Footman"
	total_positions = 100
	spawn_positions = 100

/datum/job/roguetown/manorguard/ctf_north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf/north)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/guildmaster/ctf_north
	title = "Heartfelt Guildmaster"
	total_positions = 5
	spawn_positions = 5

/datum/job/roguetown/guildmaster/ctf_north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf/north)
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)
		H.adjust_skillrank_up_to(/datum/skill/craft/armorsmithing, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/crafting, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/engineering, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/sewing, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/smelting, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/masonry, SKILL_EXP_LEGENDARY)

// ! HEARTFELT ! //

// CAPTAIN

/obj/effect/landmark/start/red_captain
	name = "Heartfelt Captain"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Knight Captain")

/obj/effect/landmark/start/red_captain/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// KNIGHT

/obj/effect/landmark/start/red_knight
	name = "Heartfelt Knight"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Knight")

/obj/effect/landmark/start/red_knight/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// TEMPLAR

/obj/effect/landmark/start/red_templar
	name = "Heartfelt Templar"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Templar")

/obj/effect/landmark/start/red_templar/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// CASTER

/obj/effect/landmark/start/red_caster
	name = "Heartfelt Caster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Caster")

/obj/effect/landmark/start/red_caster/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// FOOTMAN

/obj/effect/landmark/start/red_footman
	name = "Heartfelt Footman"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Footman")

/obj/effect/landmark/start/red_ranger/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// GUILDMASTER

/obj/effect/landmark/start/red_master
	name = "Heartfelt Guildmaster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Guildmaster")

/obj/effect/landmark/start/red_master/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc
