/datum/job/roguetown/captain/ctf
	title = "Azure Dawn Captain" 
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	display_order = JDO_GUARD_CAPTAIN
	advclass_cat_rolls = list(CTAG_CAPTAIN = 20)

	outfit = /datum/outfit/job/roguetown/captain
	job_subclasses = list(
		/datum/advclass/captain/infantry
	)

/obj/item/roguekey/manor/ctf
	name = "Team South key"
	lockid = "teamSouth"
	visual_replacement = /obj/item/roguekey/royal

/obj/item/roguekey/manor/ctf/north
	name = "Team North key"
	lockid = "teamNorth"

/obj/structure/fluff/walldeco/customflag/ctf
	name = "Custom Flag"

/obj/structure/fluff/walldeco/customflag/ctf/attack_hand(mob/user)
	. = ..()
	if(do_after(usr, 5))
		SSticker.force_ending = 1
		SSblackbox.record_feedback("tally", "admin_verb", 1, "End Round")
	
	SSticker.force_ending = 1
	SSblackbox.record_feedback("tally", "admin_verb", 1, "End Round")

/obj/structure/fluff/walldeco/customflag/ctf/Azure_Dawn
	name = "Azure Dawn flag"

/obc/structure/fluff/walldeco/customflag/ctf/Hartfield
//	name = "Hartfield flag"

/datum/job/roguetown/captain/ctf/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		var/mob/living/carbon/human/H = L
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/magician/ctf
	title = "Azure Dawn Caster"
	total_positions = 3
	spawn_positions = 3
	outfit = /datum/outfit/job/roguetown/magician

/datum/job/roguetown/magician/ctf/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/adventurer/ctf
	title = "Azure Dawn Ranger"
	total_positions = 5
	spawn_positions = 5
	job_subclasses = list(
		/datum/advclass/ranger,
	)

/datum/job/roguetown/adventurer/ctf/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/knight/ctf
	title = "Azure Dawn Fighter" //Back to proper knights.
	total_positions = 90
	spawn_positions = 90
	outfit = /datum/outfit/job/roguetown/knight

	job_subclasses = list(
		/datum/advclass/knight/heavy,
		/datum/advclass/knight/footknight,
		/datum/advclass/knight/mountedknight,
		/datum/advclass/knight/irregularknight
		)
/datum/job/roguetown/knight/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		var/mob/living/carbon/human/H = L
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/guildmaster/ctf
	title = "Azure Dawn Guildmaster"
	total_positions = 3
	spawn_positions = 3
	outfit = /datum/outfit/job/roguetown/guildmaster

/datum/job/roguetown/guildmaster/ctf/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)
		H.adjust_skillrank_up_to(/datum/skill/craft/armorsmithing, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/crafting, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/engineering, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/sewing, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/smelting, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, SKILL_EXP_LEGENDARY)
		H.adjust_skillrank_up_to(/datum/skill/craft/masonry, SKILL_EXP_LEGENDARY)

/obj/effect/landmark/start/red_captain
	name = "Hartfield Captain"
	icon_state = "arrow"

/obj/effect/landmark/start/red_caster
	name = "Hartfield Caster"
	icon_state = "arrow"

/obj/effect/landmark/start/red_ranger
	name = "Hartfield Ranger"
	icon_state = "arrow"

/obj/effect/landmark/start/red_fighter
	name = "Hartfield Fighter"
	icon_state = "arrow"

/obj/effect/landmark/start/red_master
	name = "Hartfield Guildmaster"
	icon_state = "arrow"

/obj/effect/landmark/start/blue_captain
	name = "Azure Dawn Captain"
	icon_state = "arrow"

/obj/effect/landmark/start/blue_caster
	name = "Azure Dawn Caster"
	icon_state = "arrow"

/obj/effect/landmark/start/blue_ranger
	name = 	"Azure Dawn Ranger"
	icon_state = "arrow"

/obj/effect/landmark/start/blue_fighter
	name = "Azure Dawn Fighter"
	icon_state = "arrow"

/obj/effect/landmark/start/blue_master
	name = "Azure Dawn Guildmaster"
	icon_state = "arrow"
