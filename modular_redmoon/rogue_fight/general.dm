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
	name = "Scarlet Dawn flag"

/obj/structure/fluff/walldeco/customflag/ctf/Heartfelt
	name = "Heartfelt flag"

/datum/antagonist/ctf
	name = "Scarlet Dawn warrior"
	antag_hud_name = "hog-blue-1"
	antagpanel_category = "Scarlet Dawn Warrior's"
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
	name = "Heartfelt warrior"
	antag_hud_name = "hog-red-1"
	antagpanel_category = "Heartfelt warrior's"
	team_name = "Хартфилд"
	antag_hud_type = ANTAG_HUD_HEARTFELT_CTF

// ! HEARTFELT ! //

// CAPTAIN

/obj/effect/landmark/start/red_captain
	name = "Heartfelt Captain"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Heartfelt Captain")

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

// ! SCARLET DAWN ! //

// CAPTAIN

/obj/effect/landmark/start/blue_captain
	name = "Scarlet Dawn Captain"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Scarlet Dawn Captain")

/obj/effect/landmark/start/blue_captain/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// KNIGHT

/obj/effect/landmark/start/blue_knight
	name = "Scarlet Dawn Knight"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Scarlet Dawn Knight")

/obj/effect/landmark/start/blue_knight/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// TEMPLAR

/obj/effect/landmark/start/blue_templar
	name = "Scarlet Dawn Templar"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Scarlet Dawn Templar")

/obj/effect/landmark/start/blue_templar/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// CASTER

/obj/effect/landmark/start/blue_caster
	name = "Scarlet Dawn Caster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Scarlet Dawn Caster")

/obj/effect/landmark/start/blue_caster/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// FOOTMAN

/obj/effect/landmark/start/blue_footman
	name = 	"Scarlet Dawn Footman"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Scarlet Dawn Footman")

/obj/effect/landmark/start/blue_footman/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc

// GUILDMASTER

/obj/effect/landmark/start/blue_master
	name = "Scarlet Dawn Guildmaster"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Scarlet Dawn Guildmaster")

/obj/effect/landmark/start/blue_master/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc
