
class Rpg_Random_Giver : BWeaponGiver {
	override String getWeaponClass() {
		return "B_RpgLauncher";
	}
	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("BRpgRocket", randomPos);
		}
	}
}

class Glock_Random_Giver : BWeaponGiver {
	override String getWeaponClass() {
		return "B_Glock";
	}
	override String getConfigLine() {
		String config_args = "";
		bool hasSilencer = (random(0, 100)) > 50;
		if (hasSilencer) {
			config_args = "ba3";
		}
		return config_args;
	}
	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("GlockMagazine", randomPos);
		}
	}
}

class Glock_Random_Noammo_Giver : Glock_Random_Giver {
	override void SpawnMagazines() {}
}

class Fauxtech_Random_Giver : BWeaponGiver {
	static const int sight_ids[] = { 3, 4, 5, 6, 7 };
	override String getWeaponClass() {
		return "B_FauxtechOrigin";
	}
	override String getConfigLine() {
		bool hasSilencer = (random(0, 100)) > 50;
		bool hasLight = (random(0, 100)) > 50;
		let config_args = string.format("bs%i", sight_ids[random(0, 4)]);
		if (hasSilencer) {
			// TODO needs a silencer
			// config_args = string.format("%s ba1", config_args);
		}
		if (hasLight) {
			config_args = string.format("%s bm1", config_args);
		}
		return config_args;
	}
	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("BFauxDrum", randomPos);
		}
	}
}

class fauxtech_random_noammo_giver : Fauxtech_Random_Giver {
	override void SpawnMagazines() {
		
	}
}

class M4_Random_Giver : BWeaponGiver {
	static const int sight_ids[] = { 1, 2, 4, 5, 6, 7 };
	int isGl;

	override String getWeaponClass() {
		isGl = random(0, 100) > 50;
		if (isGl) {
			return "B_M4_M203";
		}
		return "B_M4";
	}

	override String getConfigLine() {
		bool hasSilencer = (random(0, 100)) > 50;
		bool hasLight = (random(0, 100)) > 50;
		let config_args = string.format("bs%i", sight_ids[random(0, 5)]);
		if (hasSilencer) {
			config_args = string.format("%s ba1", config_args);
		}
		if (hasLight) {
			config_args = string.format("%s bm1", config_args);
		}
		return config_args;
	}

	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("B556Mag", randomPos);
		}
		if (isGl) {
			amt = random(0, 3);
			for (int i = 0; i < amt; i++) {
				let randomPos = pos + (random(-8, 8), random(-8, 8));
				Spawn("HDRocketAmmo", randomPos);
			}
		}
	}

}

class M4_Random_Noammo_Giver : M4_Random_Giver {
	override void SpawnMagazines() {}
}

class M14_Random_Giver : BWeaponGiver {
	static const int sight_ids[] = { 0, 4, 5, 6, 7 };
	override String getWeaponClass() {
		return "B_M14";
	}
	override String getConfigLine() {
		bool hasSilencer = (random(0, 100)) > 50;
		bool hasLight = (random(0, 100)) > 50;
		int sight_id = sight_ids[random(0, 4)];
		let config_args = "";
		if (sight_id > 0) {
			config_args = string.format("bs%i", sight_id);
		}

		if (hasSilencer) {
			config_args = string.format("%s ba4", config_args);
		}
		if (hasLight) {
			config_args = string.format("%s bm1", config_args);
		}
		return config_args;
	}
	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("b762_m14_mag", randomPos);
		}
	}
}

class M14_random_noammo_giver : M14_Random_Giver {
	override void SpawnMagazines() {}
}

class M249_Random_Giver : BWeaponGiver {
	static const int sight_ids[] = { 0, 4, 5, 6, 7 };
	override String getWeaponClass() {
		return "B_M249";
	}
	override String getConfigLine() {
		bool hasSilencer = (random(0, 100)) > 50;
		bool hasLight = (random(0, 100)) > 50;
		int sight_id = sight_ids[random(0, 4)];
		let config_args = "";
		if (sight_id > 0) {
			config_args = string.format("bs%i", sight_id);
		}
		
		if (hasSilencer) {
			config_args = string.format("%s ba4", config_args);
		}
		if (hasLight) {
			config_args = string.format("%s bm1", config_args);
		}
		return config_args;
	}
	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("BM249Mag", randomPos);
		}
	}
}


class MP5_Random_Giver : BWeaponGiver {
	static const int sight_ids[] = { 0, 4, 5, 6, 7 };
	bool isGl;
	override String getWeaponClass() {
		isGl = (random(0, 100)) > 50;
		if (isGl) {
			return "B_MP5_M203";
		}
		return "B_MP5";
	}
	override String getConfigLine() {
		bool hasSilencer = (random(0, 100)) > 50;
		bool hasLight = (random(0, 100)) > 50;
		int sight_id = sight_ids[random(0, 4)];
		let config_args = "";
		if (sight_id > 0) {
			config_args = string.format("bs%i", sight_id);
		}
		if (hasSilencer) {
			config_args = string.format("%s ba1", config_args);
		}
		if (hasLight) {
			config_args = string.format("%s bm1", config_args);
		}
		return config_args;
	}

	override void SpawnMagazines() {
		int amt = random(0, 3);
		for (int i = 0; i < amt; i++) {
			let randomPos = pos + (random(-8, 8), random(-8, 8));
			Spawn("B9mm_MP5K_MAG", randomPos);
		}
		if (isGl) {
			amt = random(0, 3);
			for (int i = 0; i < amt; i++) {
				let randomPos = pos + (random(-8, 8), random(-8, 8));
				Spawn("HDRocketAmmo", randomPos);
			}
		}
	}	
}

class mp5_random_noammo_giver : mp5_random_giver {
	override void SpawnMagazines() {}
}