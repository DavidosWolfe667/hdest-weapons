
class B556Ammo : BRoundAmmo {
	default {
		tag "5.56x45mm round";
		hdpickup.refid "b56";
		hdpickup.bulk ENC_556;
		Inventory.Icon "BB56A7A3";
	}
	override string pickupmessage(){
		return "Picked up a stray 5.56x45mm round.";
	}
	states {
		spawn:
			BB56 A -1;
			stop;
	}
}

class B556Brass : BRoundShell {
	default {
		tag "5.56 brass";
		HDPickUp.RefId "B556Brass";
		HdPickup.Bulk 1;
		Inventory.PickupMessage "Picked up some 5.56x45mm brass.";
	}
	states {
		spawn:
			BB56 A -1;
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
		5BOX A -1;
	}
}












class BRPGRocketAmmo : BRoundAmmo {
	default {
		tag "RPG Rocket Ammo";
		hdpickup.bulk ENC_556;
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
		HDPickup.Bulk ENC_762;
		Inventory.icon "BF76A3A7";
	}
	override string pickupmessage(){
		return "Picked up a stray 7.62x51mm round.";
	}
	states {
		spawn:
			BF76 A -1;
			stop;
	}
}

class B762x51Brass : BRoundShell {
	default {
		tag "7.62x51mm brass";
		HDPickup.RefId "B762x51Casing";
		HDPickup.Bulk 1;
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
		hdupk.pickupmessage "Picked up some 5.56x45mm ammo.";
		hdupk.pickuptype "B762x51Ammo";
	}
	states{
	spawn:
		7BBX A -1;
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
			BBOX A -1;
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
					string clsname = bullets[random(0, 5)];
					let mag = Actor.Spawn(clsname, invoker.pos);
					mag.vel += (random(-2, 2), random(-2, 2), random(4, 8));
				}

			}
			stop;
	}

}