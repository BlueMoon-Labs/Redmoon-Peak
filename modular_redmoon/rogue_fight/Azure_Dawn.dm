//Всякие приколюхи, нужные для работы режима------------------------------
/obj/item/roguekey/manor/ctf
	name = "Team South key"
	lockid = "teamSouth"
	visual_replacement = /obj/item/roguekey/royal

/obj/item/roguekey/manor/ctf/north
	name = "Team North key"
	lockid = "teamNorth"

/obj/structure/fluff/walldeco/customflag/ctf
	name = "Custom Flag"
	var/my_team_name = ""

/obj/structure/fluff/walldeco/customflag/ctf/attack_hand(mob/user)
	. = ..()
	priority_announce("Флаг команды [my_team_name] снимается с флагштока! Прервите этот процесс, или команда противника победит в сражении!", "Захват флага", 'sound/misc/bell.ogg', sender = src)
	if(do_after(usr, 200))
		priority_announce("[my_team_name] проиграла, в связи с утратой своего флага. Противоположная команда победила!", "Захват флага", 'sound/misc/bell.ogg', sender = src)
		SSticker.force_ending = 1
		SSblackbox.record_feedback("tally", "ctf_flag", 1, "End Round")

/obj/structure/fluff/walldeco/customflag/ctf/Azure_Dawn
	name = "Azure Dawn flag"

/obj/structure/fluff/walldeco/customflag/ctf/Hartfield
	name = "Hartfield flag"

/datum/antagonist/ctf
	name = "Azure Dawn warrior"
	antag_hud_name = "hog-blue-1"
	antagpanel_category = "Azure Dawn Warrior's"
	var/team_name = "Алый рассвет"
	antag_hud_type = ANTAG_HUD_AZURE_CTF
	can_coexist_with_others = FALSE //Никаких вампиров-бойцов CTF или еще чего-нибудь.	

/datum/antagonist/ctf/on_gain()
	. = ..()
	add_antag_hud(antag_hud_type, antag_hud_name, owner.current)
	to_chat(owner, span_bigbold("Вы боец команды [team_name]! Сражайтесь и заполучите ключ противоположной команды, чтобы победить, забрав их флаг!"))

/datum/atom_hud/antag/ctf
	self_visible = TRUE

/datum/atom_hud/antag/ctf/north
	self_visible = TRUE


/datum/antagonist/ctf/north
	name = "Hartfield warrior"
	antag_hud_name = "hog-red-1"
	antagpanel_category = "Hartfield warrior's"
	team_name = "Хартфилд"
	antag_hud_type = ANTAG_HUD_HARTFIELD_CTF
//-----------------------------------------------------------------------

//Далее джобки и их особенности.
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


/datum/job/roguetown/captain/ctf/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		var/mob/living/carbon/human/H = L
		L.mind.add_antag_datum(/datum/antagonist/ctf)
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
		H.mind.add_antag_datum(/datum/antagonist/ctf)
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
		H.mind.add_antag_datum(/datum/antagonist/ctf)
		var/obj/item/roguekey/manor/ctf/key = new /obj/item/roguekey/manor/ctf(src)
		H.put_in_hands(key, forced = TRUE)

/datum/job/roguetown/knight/ctf
	title = "Azure Dawn Fighter" //Back to proper knights.
	total_positions = 90
	spawn_positions = 90
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	min_pq = 0

	job_subclasses = list(
		/datum/advclass/knight/heavy,
		/datum/advclass/knight/footknight,
		/datum/advclass/knight/mountedknight,
		/datum/advclass/knight/irregularknight
		)
/datum/job/roguetown/knight/after_spawn(mob/living/L, mob/M, latejoin)
	. = ..()
	if(L)
		L.mind.add_antag_datum(/datum/antagonist/ctf)
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

/obj/effect/landmark/start/red_captain
	name = "Hartfield Captain"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Hartfield Captain")

/obj/effect/landmark/start/red_captain/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/red_caster
	name = "Hartfield Caster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Hartfield Caster")

/obj/effect/landmark/start/red_caster/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/red_ranger
	name = "Hartfield Ranger"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Hartfield Ranger")

/obj/effect/landmark/start/red_ranger/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/red_fighter
	name = "Hartfield Fighter"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Hartfield Fighter")

/obj/effect/landmark/start/red_fighter/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/red_master
	name = "Hartfield Guildmaster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Hartfield Guildmaster")


/obj/effect/landmark/start/red_master/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/blue_captain
	name = "Azure Dawn Captain"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Azure Dawn Captain")

/obj/effect/landmark/start/blue_captain/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/blue_caster
	name = "Azure Dawn Caster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Azure Dawn Caster")

/obj/effect/landmark/start/blue_caster/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/blue_ranger
	name = 	"Azure Dawn Ranger"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Azure Dawn Ranger")

/obj/effect/landmark/start/blue_ranger/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/blue_fighter
	name = "Azure Dawn Fighter"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Azure Dawn Fighter")

/obj/effect/landmark/start/blue_fighter/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

/obj/effect/landmark/start/blue_master
	name = "Azure Dawn Guildmaster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Azure Dawn Guildmaster")

/obj/effect/landmark/start/blue_master/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc
