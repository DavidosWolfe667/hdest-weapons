
class DeformedAmmo : BRoundAmmo {
	default {
		tag "Deformed round";
		hdpickup.bulk 0.01;
		Inventory.Icon "BB56A7A3";
		-hdpickup.fitsinbackpack
	}
	override string pickupmessage() {
		return "Picked up a deformed round.";
	}
	states {
		spawn:
			BB56 A -1;
			stop;
	}
}

class DeformedShell : BRoundAmmo {
	default {
		tag "Deformed 12 gauge shell";
		hdpickup.bulk 0.01;
		Inventory.Icon "SHELA0";
		-hdpickup.fitsinbackpack
	}
	override string pickupmessage() {
		return "Picked up a deformed round.";
	}
	states {
		spawn:
			SHL1 A -1;
			stop;
	}
}

class B556Ammo : BRoundAmmo {
	default {
		tag "5.56x45mm round";
		hdpickup.refid "b56";
		hdpickup.bulk c_556_round_bulk;
		Inventory.Icon "BB56A7A3";
	}
	override string pickupmessage(){
		return "Picked up a stray 5.56x45mm round.";
	}

	override void SplitPickup(){
		SplitPickupBoxableRound(10,100,"B_556_Box","BS56A0","BB56A7A3");
	}

	states {
		spawn:
			BB56 A -1;
			stop;
		dummy:
			BS56 A -1;
			stop;
	}
	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_M4");
		itemsthatusethis.push("B_M4_M203");
		itemsthatusethis.push("B_M249");
		itemsthatusethis.push("B556Mag");
	}
}

class B556Brass : BRoundShell {
	default {
		tag "5.56 brass";
		HDPickUp.RefId "b5b";
		HdPickup.Bulk c_556_spent_bulk;
		Inventory.PickupMessage "Picked up some 5.56x45mm brass.";
	}
	states {
		spawn:
			BF56 A -1;
			Stop;
	}	
}

class B556Spent : BRoundSpent {
	default {
		BRoundSpent.ShellClass "B556Brass";
		HDUPK.PickupType "B556Brass";
		HDUPK.PickupMessage "Picked up some 5.56x45mm brass.";
	}
	states {
		spawn:
			BF56 A 2 {
				angle+=45;
				if(floorz==pos.z&&!vel.z)A_Countdown();
			}
			Wait;

		death:
			BF56 A -1 {
				actor p=spawn(invoker.shellClass,self.pos,ALLOW_REPLACE);
				p.vel = self.vel;
				p.vel.xy*=3;
				p.angle=angle;
				if(p.vel!=(0,0,0)){
					p.A_FaceMovementDirection();
					p.angle+=90;
				}
				destroy();
			}
			Stop;
	}
}

class B_556_Box : HDUPK {
	default{
		//$Category "Ammo/Hideous Destructor/"
		//$Title "Box of 9mm"
		//$Sprite "9BOXA0"

		scale 0.4;
		hdupk.amount 100;
		hdupk.pickupsound "weapons/pocket";
		hdupk.pickupmessage "Picked up some 5.56x45mm ammo.";
		hdupk.pickuptype "B556Ammo";
	}
	states{
	spawn:
		AB56 A -1;
	}
}











// Am I using this?
class BRPGRocketAmmo : BRoundAmmo {
	default {
		tag "RPG Rocket Ammo";
		hdpickup.bulk ENC_556;
		-hdpickup.fitsinbackpack
	}
	override string pickupmessage() {
		return "Picked up an RPG rocket";
	}
	states(actor) {
		spawn:
			RPGR A -1;
			stop;
	}
}








class B762x51Ammo : BRoundAmmo {
	default {
		tag "7.62x51mm round";
		HDPickup.RefId "b75";
		HDPickup.Bulk c_762_round_bulk;
		Inventory.icon "BF76A3A7";
	}
	override string pickupmessage(){
		return "Picked up a stray 7.62x51mm round.";
	}
	override void GetItemsThatUseThis() {
		itemsthatusethis.push("B_M14");
		itemsthatusethis.push("b762_m14_mag");
	}
	override void SplitPickup(){
		SplitPickupBoxableRound(10,50,"B_762_Box","BS76A0","BF76A3A7");
	}
	states {
		spawn:
			BF76 A -1;
			stop;
		dummy:
			BS76 A -1;
			stop;
	}
}

class B762x51Brass : BRoundShell {
	default {
		tag "7.62x51mm brass";
		HDPickup.RefId "b7b";
		HDPickup.Bulk c_762_spent_bulk;
		Inventory.PickupMessage "Picked up some 7.62x51mm brass.";
	}
	states {
		spawn:
			BB76 A -1;
			Stop;
	}	
}

class B762x51Spent : BRoundSpent {
	default {
		BRoundSpent.ShellClass "B762x51Brass";
		HDUPK.PickupType "B762x51Brass";
		HDUPK.PickupMessage "Picked up some 7.62x51 brass.";
	}

	states {
		spawn:
			BB76 A 2 {
				angle+=45;
				if(floorz==pos.z&&!vel.z)A_Countdown();
			}
			Wait;

		death:
			BB76 A -1 {
				actor p=spawn(invoker.shellClass,self.pos,ALLOW_REPLACE);
				p.vel = self.vel;
				p.vel.xy*=3;
				p.angle=angle;
				if(p.vel!=(0,0,0)){
					p.A_FaceMovementDirection();
					p.angle+=90;
				}
				destroy();
			}
			Stop;
	}
}

class B_762_Box : HDUPK {
	default{
		//$Category "Ammo/Hideous Destructor/"
		//$Title "Box of 9mm"
		//$Sprite "9BOXA0"

		scale 0.4;
		hdupk.amount 50;
		hdupk.pickupsound "weapons/pocket";
		hdupk.pickupmessage "Picked up some 7.62x51mm ammo.";
		hdupk.pickuptype "B762x51Ammo";
	}
	states{
	spawn:
		AB76 A -1;
	}
}










class BAmBox : HDUPK {

	default {
		+shootable
		+noblood
		+nopain
		+ghost
		+lookallaround
		+nofear
		scale 0.6;
		height 8;
		radius 12;
		health 100;
		mass 120;
		meleerange 42;
		radiusdamagefactor 0.5;
		obituary "%o has seen the true power of the level 1 warrior.";
		tag "Bryan's Ammo Box";
	}

	static const string magazines[] = {
		"B556Mag",
		"BM249Mag",
		"B9mm_MP5K_MAG",
		"BFauxDrum",
		"b762_m14_mag",
		"GlockMagazine"
	};

	static const string bullets[] = {
		"B_556_Box",
		"B_556_Box",
		"B_762_Box",
		"B_556_Box",
		"B_556_Box",
		"B_762_Box"
	};

	states {
		spawn:
			AMBX A -1;
			stop;
		grab:
		tap:
			---- A 0 {
				invoker.vel += (0, 0, 4);
			}
			---- A 10;
			---- A 0 {
				int rng_count = random(1, 2);
				for (int i = 0; i < rng_count; i++) {
					string clsname = bullets[random(0, 5)];
					let mag = Actor.Spawn(clsname, invoker.pos);
					mag.vel += (random(-2, 2), random(-2, 2), random(4, 8));
				}

			}
			stop;
	}

}





class BRocketPickup : HDUPK{
	default{
		//$Category "Ammo/Hideous Destructor/"
		//$Title "Box of Rocket Grenades"
		//$Sprite "BROKA0"

		scale 0.5;
		hdupk.pickupmessage "Picked up a box of rpg rockets.";
		hdupk.pickuptype "BRpgRocket";
		hdupk.amount 5;
	}
	override void postbeginplay(){
		super.postbeginplay();
		//A_SpawnItemEx("BRpgRocket",10,0,0,0,0,0,0,0,220);
		//A_SpawnItemEx("BRpgRocket",13,0,0,0,0,0,0,0,220);
		//A_SpawnItemEx("BRpgRocket",16,0,0,0,0,0,0,0,220);
	}
	states{
	spawn:
		RBOX A -1;
		stop;
	}
}

class BResourceBox : HDUPK {

	default {
		+shootable
		+noblood
		+nopain
		+ghost
		+lookallaround
		+nofear
		scale 0.6;
		height 8;
		radius 12;
		health 100;
		mass 120;
		meleerange 42;
		radiusdamagefactor 0.5;
		obituary "%o has seen the true power of the level 1 warrior.";
		tag "Bryan's Resource Box";
	}

	static const string classNames[] = {
		"B_GunPowderBag",
		"B_LeadRock",
		"B_BrassSheets"
	};

	states {
		spawn:
			RSBX A -1;
			stop;
		grab:
		tap:
			---- A 0 {
				invoker.vel += (0, 0, 4);
			}
			---- A 10;
			---- A 0 {
				int rng_count = 5;
				for (int i = 0; i < rng_count; i++) {
					string clsname = classNames[random(0, 2)];
					let mag = Actor.Spawn(clsname, invoker.pos);
					mag.vel += (random(-2, 2), random(-2, 2), random(4, 8));
				}

			}
			stop;
	}

}