/datum/job/roguetown/captain/ctf_south
	title = "Scarlet Dawn Knight Captain"
	total_positions = 1
	spawn_positions = 1

/datum/job/roguetown/captain/ctf_south/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf)
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/knight/ctf_south
	title = "Scarlet Dawn Knight"
	total_positions = 5
	spawn_positions = 5
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	min_pq = 0

/datum/job/roguetown/knight/ctf_south/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		L.mind.add_antag_datum(/datum/antagonist/ctf)
		var/mob/living/carbon/human/H = L
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/magician/ctf_south
	title = "Scarlet Dawn Caster"
	total_positions = 5
	spawn_positions = 5

/datum/job/roguetown/magician/ctf_south/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf)
		var/obj/item/roguekey/manor/ctfkey = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/templar/ctf_south
	title = "Scarlet Dawn Templar"
	total_positions = 5
	spawn_positions = 5

/datum/job/roguetown/templar/ctf_south/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf)
		var/obj/item/roguekey/manor/ctfkey = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/manorguard/ctf_south
	title = "Scarlet Dawn Footman"
	total_positions = 100
	spawn_positions = 100

/datum/job/roguetown/manorguard/ctf_south/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf)
		var/obj/item/roguekey/manor/ctfkey = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/guildmaster/ctf_south
	title = "Scarlet Dawn Guildmaster"
	total_positions = 5
	spawn_positions = 5

/datum/job/roguetown/guildmaster/ctf_south/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		H.mind.add_antag_datum(/datum/antagonist/ctf)
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
