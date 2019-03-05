/mob/living
	var/obj/structure/disposalpipe/trunk/Gtrunk
/mob/living/proc/GarbageAttackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	if(src.inflatable == 0)
		return 0
	if (istype(W, /obj/item/weapon/wrench))
		if(Gtrunk)
			Gtrunk.linked = null
			Gtrunk = null
			user << "<span class='notice'>You disconnect \the [src] from the port.</span>"
			update_icon()
			playsound(src, W.usesound, 50, 1)
			return 1
		else
			var/obj/structure/disposalpipe/trunk/trunk = locate() in src.loc
			if(trunk)
				user << "<span class='notice'>You connect \the [src] to the port.</span>"
				trunk.linked = src	// link the pipe trunk to self
				Gtrunk = trunk
				update_icon()
				playsound(src, W.usesound, 50, 1)
				return 1
			else
				user << "<span class='notice'>\The [src] failed to connect to the port.</span>"
				return 0
	return 0
/mob/living/proc/expel(var/obj/structure/disposalholder/H)

	flick("outlet-open", src)
	playsound(src, 'sound/machines/warning-buzzer.ogg', 50, 0, 0)
	sleep(20)	//wait until correct animation frame
	playsound(src, 'sound/machines/hiss.ogg', 50, 0, 0)

	if(H)
		for(var/atom/movable/AM in H)
			AM.forceMove(vore_selected)
		H.vent_gas(src.loc)
		qdel(H)

		return
/obj/structure/disposalpipe/trunk/transfer(var/obj/structure/disposalholder/H)
	if(linked)
		var/mob/living/O = linked
		if(istype(O) && (H))
			O.expel(H)	// expel at outlet
			return null
	. = ..()
/obj/structure/disposalpipe/trunk/getlinked()
	linked = null
	var/mob/living/O = locate() in src.loc
	if(O)
		linked = O
		return
	. = ..()