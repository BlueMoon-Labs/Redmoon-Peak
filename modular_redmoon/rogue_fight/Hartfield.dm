/datum/job/roguetown/captain/ctf/north
	title = "Hartfield Captain" 

/datum/job/roguetown/captain/ctf/north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/magician/ctf/north
	title = "Hartfield Caster"

/datum/job/roguetown/magician/ctf/north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/adventurer/ctf/north
	title = "Hartfield Ranger"

/datum/job/roguetown/adventurer/ctf/north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/knight/ctf/north
	title = "Hartfield Fighter"

	job_subclasses = list(
		/datum/advclass/knight/heavy,
		/datum/advclass/knight/footknight,
		/datum/advclass/knight/mountedknight,
		/datum/advclass/knight/irregularknight
		)
/datum/job/roguetown/knight/north/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		var/mob/living/carbon/human/H = L
		var/obj/item/roguekey/manor/ctf/north/key = new /obj/item/roguekey/manor/ctf/north(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/guildmaster/ctf/north
	title = "Hartfield Guildmaster"

/datum/job/roguetown/guildmaster/ctf/north/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
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
