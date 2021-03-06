//Xenomicrobes

/datum/disease/xeno_transformation
	name = "Xenomorph Transformation"
	max_stages = 5
	spread = "Syringe"
	spread_type = SPECIAL
	curable = 1
	cure = "Spaceacillin & Glycerol"
	cure_list = list(SPACEACILLIN, GLYCEROL)
	cure_chance = 50
	agent = "Rip-LEY Alien Microbes"
	affected_species = list("Human")
	var/gibbed = 0

/datum/disease/xeno_transformation/stage_act()
	..()
	switch(stage)
		if(2)
			if (prob(8))
				to_chat(affected_mob, "My throat feels scratchy.")
				affected_mob.take_organ_damage(1)
			if (prob(9))
				to_chat(affected_mob, "<span class='warning'>Kill...</span>")
			if (prob(9))
				to_chat(affected_mob, "<span class='warning'>Kill...</span>")
		if(3)
			if (prob(8))
				to_chat(affected_mob, "<span class='warning'>My throat feels very scratchy.</span>")
				affected_mob.take_organ_damage(1)
			/*
			if (prob(8))
				affected_mob.say(pick("Beep, boop", "beep, beep!", "Boop...bop"))
			*/
			if (prob(10))
				to_chat(affected_mob, "My skin feels tight.")
				affected_mob.take_organ_damage(5)
			if (prob(4))
				to_chat(affected_mob, "<span class='warning'>I feel a stabbing pain in my head.</span>")
				affected_mob.Paralyse(2)
			if (prob(4))
				to_chat(affected_mob, "<span class='warning'>I can feel something move...inside.</span>")
		if(4)
			if (prob(10))
				to_chat(affected_mob, pick("<span class='warning'>My skin feels very tight.</span>", "<span class='warning'>My blood boils!</span>"))
				affected_mob.take_organ_damage(8)
			if (prob(8))
				to_chat(affected_mob, "<span class='warning'>I can feel... something...inside me.</span>")
		if(5)
			to_chat(affected_mob, "<span class='warning'>My skin feels impossibly calloused...</span>")
			affected_mob.adjustToxLoss(10)
			affected_mob.updatehealth()
			if(prob(40))
				if(gibbed != 0)
					return 0
				gibs(affected_mob)
				gibbed = 1
				affected_mob:Alienize()

