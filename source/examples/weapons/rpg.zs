
class B_RPGLauncher : BaseRPG {

	default {
		+hdweapon.fitsinbackpack
		weapon.selectionorder        20;
		weapon.slotnumber            7;
		weapon.slotpriority          1;
		inventory.pickupsound        "misc/w_pkup";
		inventory.pickupmessage      "You got the RPG Launcher.";
		scale                        0.7;
		weapon.bobrangex             0.22;
		weapon.bobrangey             0.9;
		obituary                     "%o was assaulted by %k.";
		tag                          "RPG Launcher";
		inventory.icon               "RPGPA0";
		BHDWeapon.BFlashSprite       "TNT1A0";
		BHDWeapon.BHeatDrain         12;
		BHDWeapon.BBulletClass       "";
		BHDWeapon.BAmmoClass         "BRpgRocketAmmo";
		BHDWeapon.BMagazineClass     "BRpgRocket";
		BHDWeapon.BGunMass           3.0;
		BHDWeapon.BCookOff           30;
		BHDWeapon.BHeatLimit         255;
		BHDWeapon.BSpriteWithMag     "RPGPA0";
		BHDWeapon.BSpriteWithoutMag  "RPGPB0";
		BHDWeapon.BSpriteWithFrame    0;
		BHDWeapon.BSpriteWithoutFrame 1;
		BHDWeapon.BMagazineSprite    "RPGRA7A3";
		BHDWeapon.BWeaponBulk        140;
		BHDWeapon.BMagazineBulk      30;
		BHDWeapon.BBulletBulk        1;
		BHDWeapon.BMagazineCapacity  1;
		BHDWeapon.BarrelLength       25;
		BHDWeapon.BarrelWidth        1;
		BHDWeapon.BarrelDepth        3;
		
		BHDWeapon.BFireSound         "weapons/m4/fire";
		BHDWeapon.BSFireSound        "weapons/m4/silentfire";
		BHDWeapon.BChamberSound      "weapons/m4/chamber";
		BHDWeapon.BBoltForwardSound  "weapons/m4/boltback";
		BHDWeapon.BBoltBackwardSound "weapons/m4/boltforward";
		BHDWeapon.BClickSound        "weapons/m4/click";
		BHDWeapon.BLoadSound         "weapons/m4/clipinsert";
		BHDWeapon.BUnloadSound       "weapons/m4/clipeject";

		BHDWeapon.BROF               0.5;
		BHDWeapon.BBackOffsetX       -7;
		BHDWeapon.BBackOffsetY       40;
		BHDWeapon.BFrontSightImage   "m16iron";
		BHDWeapon.BFrontOffsetX      0;
		BHDWeapon.BFrontOffsetY      22;
		BHDWeapon.BSilentOffsetX     0;
		BHDWeapon.BSilentOffsetY     0;
		BHDWeapon.bBarrelMount       "556_NATO_BARREL";
		BHDWeapon.bScopeMount        "NATO_RAILS";
		BHDWeapon.bMiscMount         "NATO_RAILS";
		BHDWeapon.EjectShellClass    "B556Spent";
		hdweapon.refid               B_RPGL_REFID;

		BHDWeapon.BLayerSight   104;
		BHDWeapon.bLayerRHand   105;
		BHDWeapon.bLayerGunBack -99;
		BHDWeapon.BAmmoHudScale 0.8;
	}

	states {
		Spawn:
			RPGP A -1 {
				if (!invoker.chambered()) {
					return ResolveState("SpawnNoRocket");
				}
				return ResolveState(NULL);
			}
			Stop;

		SpawnNoRocket:
			RPGP B -1;
			Stop;

		LayerGun:
			RPGG A 0 {
				if (!invoker.chambered()) {
					return ResolveState("LayerGunEmpty");
				}
				return ResolveState(NULL);
			}
			#### # 1;
			Loop;

		LayerGunEmpty:
			RPGG B 1;
			Loop;

		LayerGunFire:
			RPGG B 1;
			Goto LayerGun;

		LayerGunBolt:
			RPGG A 3;
			Goto LayerGun;

		LayerReloadHands:
			TNT1 A 0;
			Goto Super::LayerReloadHands;

		LayerDefaultSight:
			TNT1 A 1;
			Loop;

		// Did I actually need this?
		PullBolt:
			Stop;

		GunPullBolt:
			Goto LayerGun;
	}



}