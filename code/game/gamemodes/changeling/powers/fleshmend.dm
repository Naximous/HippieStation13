/obj/effect/proc_holder/changeling/fleshmend
	name = "Fleshmend"
	desc = "Our flesh rapidly regenerates, healing our wounds."
	helptext = "Heals a moderate amount of damage over a short period of time. Can be used while unconscious."
	chemical_cost = 25
	dna_cost = 2
	req_stat = UNCONSCIOUS

//Starts healing you every second for 10 seconds. Can be used whilst unconscious.
/obj/effect/proc_holder/changeling/fleshmend/sting_action(var/mob/living/user)
	user << "<span class='notice'>We begin to heal rapidly.</span>"
	spawn(0)
		for(var/i = 0, i<10,i++)
			user.adjustBruteLoss(-10)
			user.adjustOxyLoss(-10)
			user.adjustFireLoss(-10)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				for(var/obj/item/organ/limb/L in H.organs)
					L.bloodloss = 0
			user.update_damage_overlays()
			sleep(10)

	feedback_add_details("changeling_powers","RR")
	return 1