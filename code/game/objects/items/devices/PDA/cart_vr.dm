/obj/item/weapon/cartridge/scale
	name = "\improper WeightCheck"

/obj/item/weapon/cartridge/scale/proc/CheckWeight(var/mob/living/user)
	if(user.weight) //Just in case.
		var/kilograms = round(text2num(user.weight),4) / 2.20463
		user << ("<span class='notice'>[user] displays a reading of [user.weight]lb / [kilograms]kg </span>")

/obj/item/weapon/cartridge/scale/initialize()
	if(civilian_cartridges.Find(/obj/item/weapon/cartridge/scale) == 0)
		civilian_cartridges += /obj/item/weapon/cartridge/scale
	. = ..()

/obj/item/device/pda/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	if(cartridge == /obj/item/weapon/cartridge/scale)
		cartridge:CheckWeight(user)
	..()
