/obj/effect/proc_holder/spell/self/conjure_armor/conjure_mask
	name = "Conjure Mask"
	desc = "Conjure a simple purple-black face mask.\n\
	The mask lasts until it is broken, a new one is summoned, or the spell is forgotten. Your face slot must be free to use this."
	overlay_state = "conjure_armor"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 40
	chargedrain = 1
	chargetime = 2 SECONDS
	no_early_release = TRUE
	recharge_time = 2 MINUTES

	warnie = "spellwarning"
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 1
	spell_tier = 1

	invocations = list("Velo Arcanum!") // arcane veil
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_LOW

	objtoequip = /obj/item/clothing/mask/rogue/conjured_mask
	slottoequip = SLOT_WEAR_MASK
	checkspot = "mask"
