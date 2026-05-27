const CARDS = {
	# ================= SINDER =================
	"Sinder.Pl10": [69, "vt", 10, null, "Age: 14,009\nHeight: 5'5.5\nWeight: 123 lbs\nType: Fire\nStrength: Grass\nWeakness: Water\nWhen at her lowest, the dormant demonic energies within Sinder awoke, transforming her into her most powerful form.", "fire"],
	"Sinder.Pl9": [68, "vt", 9, null, "Age: 14,009\nHeight: 5'5.5\nWeight: 123 lbs\nType: Fire\nStrength: Grass\nWeakness: Water\nA fiery wolf girl who was banished from Hell and cursed to be a half hellhound, half human 'monster'.", "fire"],
	"Sinder.Pl8": [67, "vt", 8, "res://Scripts/Abilties/Sinder.gd", "Age: 14,009\nHeight: 5'5.5\nWeight: 123 lbs\nType: Fire\nStrength: Grass\nWeakness: Water\nSnap: +1 PL to Target VT, you may draw a card if it's a PL9 or PL10 VT.", "fire"],
	"Sinder.Pl10.Gr": [null, "vt", 10, null, "", "fire"],
	"PyroPup": [149, "mascot", 0, null, "Age: Unknown\nHeight: Unknown\nWeight: Unknown\nEcho: -1 PL to target Backstage VT.\n+1 PL to Fire type VTs\n+1 PL to Sinder"],

	# ================= SHYLILY =================
	"Shylily.Pl10": [24, "vt", 10, null, "", "water"],
	"Shylily.Pl9": [23, "vt", 9, null, "", "water"],
	"Shylily.Pl8": [22, "vt", 8, null, "", "water"],
	"Shylily.Pl10.Gr": [null, "vt", 10, null, "", "water"],

	# ================= MONARCH =================
	"Monarch.Pl9": [null, "vt", 9, null, "", "water"],
	"Monarch.Pl8": [null, "vt", 8, null, "", "water"],
	"MultiverseMonarch.Pl10": [null, "vt", 10, null, "", "water"],
	"MultiverseMonarch.Pl10.Gr": [null, "vt", 10, null, "", "water"],
	"MonarchMessengerClone": [null, "mascot", 0, null, ""],

	# ================= BAO THE WHALE =================
	"BaoTheWhale.Pl10": [null, "vt", 10, null, "", "water"],
	"BaoTheWhale.Pl9": [null, "vt", 9, null, "", "water"],
	"BaoTheWhale.Pl8": [null, "vt", 8, null, "", "water"],
	"BaoTheWhale.Pl10.Gr": [null, "vt", 10, null, "", "water"],

	# ================= EBIKO =================
	"Ebiko.Pl10": [null, "vt", 10, null, "", "water"],
	"Ebiko.Pl9": [null, "vt", 9, null, "", "water"],
	"Ebiko.Pl8": [null, "vt", 8, null, "", "water"],
	"Ebiko.Pl10.Gr": [null, "vt", 10, null, "", "water"],

	# ================= FOXYREINE =================
	"Foxyreine.Pl10": [null, "vt", 10, null, "", "water"],
	"Foxyreine.Pl9": [null, "vt", 9, null, "", "water"],
	"Foxyreine.Pl8": [null, "vt", 8, null, "", "water"],
	"Foxyreine.Pl10.Gr": [null, "vt", 10, null, "", "water"],

	# ================= FROGGYLOCH =================
	"Froggyloch.Pl10": [null, "vt", 10, null, "", "water"],
	"Froggyloch.Pl9": [null, "vt", 9, null, "", "water"],
	"Froggyloch.Pl8": [null, "vt", 8, null, "", "water"],
	"Froggyloch.Pl10.Gr": [null, "vt", 10, null, "", "water"],
	"Froglodyte": [null, "mascot", 0, null, ""],

	# ================= MEGALODONVT =================
	"Megalodonvt.Pl10": [null, "vt", 10, null, "", "water"],
	"Megalodonvt.Pl9": [null, "vt", 9, null, "", "water"],
	"Megalodonvt.Pl8": [null, "vt", 8, null, "", "water"],
	"Megalodonvt.Pl10.Gr": [null, "vt", 10, null, "", "water"],

	# ================= NYANNERS =================
	"Nyanners.Pl10": [null, "vt", 10, null, "", "water"],
	"Nyanners.Pl9": [null, "vt", 9, null, "", "water"],
	"Nyanners.Pl8": [null, "vt", 8, null, "", "water"],
	"Nyanners.Pl10.Gr": [null, "vt", 10, null, "", "water"],

	# ================= BUFFPUP =================
	"Buffpup.Pl10": [null, "vt", 10, null, "", "grass"],
	"Buffpup.Pl9": [null, "vt", 9, null, "", "grass"],
	"Buffpup.Pl8": [null, "vt", 8, null, "", "grass"],
	"Buffpup.Pl10.Gr": [null, "vt", 10, null, "", "grass"],
	"Pup": [null, "mascot", 0, null, ""],

	# ================= EVIL BUFFPUP =================
	"EvilBuffpup.Pl10": [null, "vt", 10, null, "", "grass"],
	"EvilBuffpup.Pl9": [null, "vt", 9, null, "", "grass"],
	"EvilBuffpup.Pl8": [null, "vt", 8, null, "", "grass"],
	"EvilBuffpup.Pl10.Gr": [null, "vt", 10, null, "", "grass"],
	"Evilbot": [null, "mascot", 0, null, ""],

	# ================= COQUI =================
	"Coqui.Pl10": [null, "vt", 10, null, "", "grass"],
	"Coqui.Pl9": [null, "vt", 9, null, "", "grass"],
	"Coqui.Pl8": [null, "vt", 8, null, "", "grass"],
	"Coqui.Pl10.Gr": [null, "vt", 10, null, "", "grass"],

	# ================= DOKIBIRD =================
	"Dokibird.Pl10": [null, "vt", 10, null, "", "grass"],
	"Dokibird.Pl10.Gr": [null, "vt", 10, null, "", "grass"],
	"DokisTrueForm.Pl9": [null, "vt", 9, null, "", "grass"],
	"DokisTrueForm.Pl8": [null, "vt", 8, null, "", "grass"],

	# ================= LAIMU =================
	"Laimu.Pl10": [null, "vt", 10, null, "", "grass"],
	"Laimu.Pl9": [null, "vt", 9, null, "", "grass"],
	"Laimu.Pl8": [null, "vt", 8, null, "", "grass"],
	"Laimu.Pl10.Gr": [null, "vt", 10, null, "", "grass"],
	"Limon": [null, "mascot", 0, null, ""],

	# ================= MEAT =================
	"Meat.Pl10": [null, "vt", 10, null, "", "grass"],
	"Meat.Pl9": [null, "vt", 9, null, "", "grass"],
	"Meat.Pl8": [null, "vt", 8, null, "", "grass"],
	"Meat.Pl10.Gr": [null, "vt", 10, null, "", "grass"],
	"Meathead": [null, "mascot", 0, null, ""],

	# ================= SILVERVALE =================
	"Silvervale.Pl10": [null, "vt", 10, null, "", "grass"],
	"Silvervale.Pl9": [null, "vt", 9, null, "", "grass"],
	"Silvervale.Pl8": [null, "vt", 8, null, "", "grass"],
	"Silvervale.Pl10.Gr": [null, "vt", 10, null, "", "grass"],

	# ================= TOB =================
	"Tob.Pl10": [null, "vt", 10, null, "", "grass"],
	"Tob.Pl9": [null, "vt", 9, null, "", "grass"],
	"Tob.Pl8": [null, "vt", 8, null, "", "grass"],
	"Tob.Pl10.Gr": [null, "vt", 10, null, "", "grass"],

	# ================= FARMER VIENNA =================
	"FarmerVienna.Pl10": [null, "vt", 10, null, "", "grass"],
	"FarmerVienna.Pl9": [null, "vt", 9, null, "", "grass"],
	"FarmerVienna.Pl8": [null, "vt", 8, null, "", "grass"],
	"FarmerVienna.Pl10.Gr": [null, "vt", 10, null, "", "grass"],
	"FarmerCosmate": [null, "mascot", 0, null, ""],

	# ================= FEFE =================
	"Fefe.Pl10": [null, "vt", 10, null, "", "fire"],
	"Fefe.Pl9": [null, "vt", 9, null, "", "fire"],
	"Fefe.Pl8": [null, "vt", 8, null, "", "fire"],
	"Fefe.Pl10.Gr": [null, "vt", 10, null, "", "fire"],

	# ================= LORD AETHELSTAN =================
	"LordAethelstan.Pl10": [null, "vt", 10, null, "", "fire"],
	"LordAethelstan.Pl9": [null, "vt", 9, null, "", "fire"],
	"LordAethelstan.Pl8": [null, "vt", 8, null, "", "fire"],
	"LordAethelstan.Pl10.Gr": [null, "vt", 10, null, "", "fire"],

	# ================= NUMI / NIHMUNE =================
	"UniversityNumi.Pl8": [null, "vt", 8, null, "", "fire"],
	"UniversityNumi.Pl9": [null, "vt", 9, null, "", "fire"],
	"Nihmune.Pl10": [null, "vt", 10, null, "", "fire"],
	"Nihmune.Pl10.Gr": [null, "vt", 10, null, "", "fire"],

	# ================= PUNKALOPI =================
	"Punkalopi.Pl10": [null, "vt", 10, null, "", "fire"],
	"Punkalopi.Pl9": [null, "vt", 9, null, "", "fire"],
	"Punkalopi.Pl8": [null, "vt", 8, null, "", "fire"],
	"Punkalopi.Pl10.Gr": [null, "vt", 10, null, "", "fire"],

	# ================= AKUMI =================
	"Akumi.Pl10": [null, "vt", 10, null, "", "fire"],
	"Akumi.Pl9": [null, "vt", 9, null, "", "fire"],
	"Akumi.Pl8": [null, "vt", 8, null, "", "fire"],
	"Akumi.Pl10.Gr": [null, "vt", 10, null, "", "fire"],

	# ================= TRICKYWI =================
	"PirateTrickywi.Pl9": [null, "vt", 9, null, "", "fire"],
	"PirateTrickywi.Pl8": [null, "vt", 8, null, "", "fire"],
	"PharaohNephasis.Pl10": [null, "vt", 10, null, "", "fire"],
	"PharaohNephasis.Pl10.Gr": [null, "vt", 10, null, "", "fire"],
	"Tricky": [null, "mascot", 0, null, ""],

	# ================= YUZU =================
	"Yuzu.Pl10": [null, "vt", 10, null, "", "fire"],
	"Yuzu.Pl9": [null, "vt", 9, null, "", "fire"],
	"Yuzu.Pl8": [null, "vt", 8, null, "", "fire"],
	"Yuzu.Pl10.Gr": [null, "vt", 10, null, "", "fire"],

	# ================= CODEMIKO =================
	"Codemiko.Pl10": [null, "vt", 10, null, "", "electric"],
	"Codemiko.Pl9": [null, "vt", 9, null, "", "electric"],
	"Codemiko.Pl8": [null, "vt", 8, null, "", "electric"],
	"Codemiko.Pl10.Gr": [null, "vt", 10, null, "", "electric"],
	"Droid": [null, "mascot", 0, null, ""],

	# ================= COTTONTAILVA =================
	"CottontailVA.Pl10.Dc": [null, "vt", 10, null, "", "electric"],
	"CottontailVA.Pl10.Dc.Gr": [null, "vt", 10, null, "", "electric"],
	"Cottontailva.Pl9": [null, "vt", 9, null, "", "electric"],
	"Cottontailva.Pl8": [null, "vt", 8, null, "", "electric"],
	"Cottontailva.Pl10.Gr": [null, "vt", 10, null, "", "electric"],
	"Fluffer": [null, "mascot", 0, null, ""],

	# ================= CYYU =================
	"CyYu.Pl10": [null, "vt", 10, null, "", "electric"],
	"CyYu.Pl9": [null, "vt", 9, null, "", "electric"],
	"CyYu.Pl8": [null, "vt", 8, null, "", "electric"],
	"CyYu.Pl10.Gr": [null, "vt", 10, null, "", "electric"],

	# ================= JUNIPER ACTIAS =================
	"JuniperActias.Pl10": [null, "vt", 10, null, "", "electric"],
	"JuniperActias.Pl9": [null, "vt", 9, null, "", "electric"],
	"JuniperActias.Pl8": [null, "vt", 8, null, "", "electric"],
	"JuniperActias.Pl10.Gr": [null, "vt", 10, null, "", "electric"],
	"BabyMoth": [null, "mascot", 0, null, ""],

	# ================= LUCY PYRE =================
	"LucyPyre.Pl10": [null, "vt", 10, null, "", "electric"],
	"LucyPyre.Pl9": [null, "vt", 9, null, "", "electric"],
	"LucyPyre.Pl8": [null, "vt", 8, null, "", "electric"],
	"LucyPyre.Pl10.Gr": [null, "vt", 10, null, "", "electric"],

	# ================= QUINN BENET =================
	"QuinnBenet.Pl10": [null, "vt", 10, null, "", "electric"],
	"QuinnBenet.Pl9": [null, "vt", 9, null, "", "electric"],
	"QuinnBenet.Pl8": [null, "vt", 8, null, "", "electric"],
	"QuinnBenet.Pl10.Gr": [null, "vt", 10, null, "", "electric"],

	# ================= RAINHOE =================
	"Rainhoe.Pl10": [null, "vt", 10, null, "", "electric"],
	"Rainhoe.Pl9": [null, "vt", 9, null, "", "electric"],
	"Rainhoe.Pl8": [null, "vt", 8, null, "", "electric"],
	"Rainhoe.Pl10.Gr": [null, "vt", 10, null, "", "electric"],

	# ================= SKY =================
	"Sky.Pl10": [null, "vt", 10, null, "", "electric"],
	"Sky.Pl9": [null, "vt", 9, null, "", "electric"],
	"Sky.Pl8": [null, "vt", 8, null, "", "electric"],
	"Sky.Pl10.Gr": [null, "vt", 10, null, "", "electric"],

	# ================= SHOTO =================
	"Shoto.Pl10": [null, "vt", 10, null, "", "electric"],
	"Shoto.Pl9": [null, "vt", 9, null, "", "electric"],
	"Shoto.Pl8": [null, "vt", 8, null, "", "electric"],
	"Shoto.Pl10.Gr": [null, "vt", 10, null, "", "electric"],

	# ================= CAMILA =================
	"Camila.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Camila.Pl9": [null, "vt", 9, null, "", "platinum"],
	"Camila.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Camila.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= DYA RIKKU / DYANTE =================
	"DyaRikku.Pl9": [null, "vt", 9, null, "", "platinum"],
	"DyaRikku.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Dyante.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Dyante.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= FREAM =================
	"Fream.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Fream.Pl9": [null, "vt", 9, null, "", "platinum"],
	"Fream.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Fream.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= HEAVENLY FATHER =================
	"HeavenlyFather.Pl10": [null, "vt", 10, null, "", "platinum"],
	"HeavenlyFather.Pl9": [null, "vt", 9, null, "", "platinum"],
	"HeavenlyFather.Pl8": [null, "vt", 8, null, "", "platinum"],
	"HeavenlyFather.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= LAYNA LAZAR =================
	"LaynaLazar.Pl10": [null, "vt", 10, null, "", "platinum"],
	"LaynaLazar.Pl9": [null, "vt", 9, null, "", "platinum"],
	"LaynaLazar.Pl8": [null, "vt", 8, null, "", "platinum"],
	"LaynaLazar.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],
	"ChibiLayna": [null, "mascot", 0, null, ""],

	# ================= NANOLESS =================
	"Nanoless.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Nanoless.Pl9": [null, "vt", 9, null, "", "platinum"],
	"Nanoless.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Nanoless.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],
	"Nanomono": [null, "mascot", 0, null, ""],

	# ================= SANSIN =================
	"Sansin.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Sansin.Pl9": [null, "vt", 9, null, "", "platinum"],
	"Sansin.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Sansin.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= TOTLESS =================
	"Totless.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Totless.Pl9": [null, "vt", 9, null, "", "platinum"],
	"Totless.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Totless.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= VEI =================
	"Vei.Pl10": [null, "vt", 10, null, "", "platinum"],
	"Vei.Pl9": [null, "vt", 9, null, "", "platinum"],
	"Vei.Pl8": [null, "vt", 8, null, "", "platinum"],
	"Vei.Pl10.Gr": [null, "vt", 10, null, "", "platinum"],

	# ================= KAIRYU CROCODILE =================
	"KairyuCrocodile.Pl10": [null, "vt", 10, null, "", "water"],
	"KairyuCrocodile.Pl9": [null, "vt", 9, null, "", "water"],
	"KairyuCrocodile.Pl8": [null, "vt", 8, null, "", "water"],
	"KairyuCrocodile.Pl10.Gr": [null, "vt", 10, null, "", "water"],
	"LittleCroc": [null, "mascot", 0, null, ""],

	# ================= OTHER MASCOTS =================
	"Pestonini": [null, "mascot", 0, null, ""],
	"Gwub": [null, "mascot", 0, null, ""],
	"Bro": [null, "mascot", 0, null, ""],
	"Sashimi": [null, "mascot", 0, null, ""],
	"Goro": [null, "mascot", 0, null, ""],
	"OrcaPup": [134, "mascot", 0, null, ""],
	"TadAndCannoli": [null, "mascot", 0, null, ""],
	"Dragoons": [null, "mascot", 0, null, ""],
	"PetalPals": [null, "mascot", 0, null, ""],
	"BatsardCat": [null, "mascot", 0, null, ""],
	"Rancid": [null, "mascot", 0, null, ""],
	"Bradley": [null, "mascot", 0, null, ""],
	"Benson": [null, "mascot", 0, null, ""],
	"Chabbit": [null, "mascot", 0, null, ""],
	"Smolcci": [null, "mascot", 0, null, ""],
	"Lampchamp": [null, "mascot", 0, null, ""],
	"Potat": [null, "mascot", 0, null, ""],
	"B": [null, "mascot", 0, null, ""],
	"Demonite": [null, "mascot", 0, null, ""],
	"Electrobytes": [null, "mascot", 0, null, ""],
	"Haze": [null, "mascot", 0, null, ""],
	"Guildie": [null, "mascot", 0, null, ""],
	"Cimp": [null, "mascot", 0, null, ""],
	"Chatblin": [null, "mascot", 0, null, ""],
	"Spike": [null, "mascot", 0, null, ""],
	"Ollie": [null, "mascot", 0, null, ""],
	"Mimi": [null, "mascot", 0, null, ""],
	"Tenki": [null, "mascot", 0, null, ""],
	"EvilPup": [null, "mascot", 0, null, ""],

	# ================= SUPPORTS =================
	"Exposed": [null, "support", 1, "res://Scripts/Abilties/Exposed.gd", "Reveal the top 2 cards of your Opp's deck, you may put them both on top or bottom in any order.", "boost"],
	"Exposed.Sr": [null, "support", 1, "res://Scripts/Abilties/Exposed.gd", "Reveal the top 2 cards of your Opp's deck, you may put them both on top or bottom in any order.", "boost"],
	"FireShield": [null, "support", 1, null, "", "boost"],
	"WaterShield": [null, "support", 1, null, "", "boost"],
	"GrassShield": [null, "support", 1, null, "", "boost"],
	"ElectricShield": [null, "support", 1, null, "", "boost"],
	"PlatinumShield": [null, "support", 1, null, "", "boost"],
	"FireGuardian": [null, "support", 1, "res://Scripts/Abilties/FireGuardian.gd", "Search your deck for a Fire VT that evolves from one on your Backstage, OR a Fire PL8 VT.", "boost"],
	"WaterGuardian": [null, "support", 1, "res://Scripts/Abilties/WaterGuardian.gd", "Search your deck for a Water VT that evolves from one on your Backstage, OR a Water PL8 VT.", "boost"],
	"GrassGuardian": [null, "support", 1, "res://Scripts/Abilties/GrassGuardian.gd", "Search your deck for a Grass VT that evolves from one on your Backstage, OR a Grass PL8 VT.", "boost"],
	"ElectricGuardian": [null, "support", 1, "res://Scripts/Abilties/ElectricGuardian.gd", "Search your deck for an Electric VT that evolves from one on your Backstage, OR an Electric PL8 VT.", "boost"],
	"PlatinumGuardian": [null, "support", 1, "res://Scripts/Abilties/PlatinumGuardian.gd", "Search your deck for a Steel VT that evolves from one on your Backstage, OR a Steel PL8 VT.", "boost"],
	"Harpoon": [null, "support", 1, "res://Scripts/Abilties/Harpoon.gd", "-3 PL to Shylily's VT.", "boost"],
	"Harpoon.Sr": [null, "support", 1, "res://Scripts/Abilties/Harpoon.gd", "-3 PL to Shylily's VT.", "boost"],
	"CyanideChan": [null, "support", 1, "res://Scripts/Abilties/CyanideChan.gd", "+1 PL. Lock: If Happiness-Chan is attached to this VT, discard the top card of your Opp's deck.", "ally"],
	"CyanideChan.Sr": [null, "support", 1, "res://Scripts/Abilties/CyanideChan.gd", "+1 PL. Lock: If Happiness-Chan is attached to this VT, discard the top card of your Opp's deck.", "ally"],
	"HappinessChan": [null, "support", 1, "res://Scripts/Abilties/HappinessChan.gd", "+1 PL. Lock: If Cyanide-Chan is attached to this VT, draw 1 card.", "ally"],
	"HappinessChan.Sr": [null, "support", 1, "res://Scripts/Abilties/HappinessChan.gd", "+1 PL. Lock: If Cyanide-Chan is attached to this VT, draw 1 card.", "ally"],
	"SnackCat": [null, "support", 1, "res://Scripts/Abilties/SnackCat.gd", "When your Opp. plays a Mascot, search your deck for a Mascot, reveal it, and add it to your hand.", "reinforcement", "opponent_mascot"],
	"SnackCat.Sr": [null, "support", 1, "res://Scripts/Abilties/SnackCat.gd", "When your Opp. plays a Mascot, search your deck for a Mascot, reveal it, and add it to your hand.", "reinforcement", "opponent_mascot"],
	"WorkLifeBalance": [null, "support", 1, null, "", "ally"],
	"WorkLifeBalance.Sr": [null, "support", 1, null, "", "ally"],
	"WhiteKnight": [null, "support", 1, null, "", "ally"],
	"WhiteKnight.Sr": [null, "support", 1, null, "", "ally"],
	"ButchersBlade": [null, "support", 1, null, "", "reinforcement", "opponent_lock"],
	"ButchersBlade.Sr": [null, "support", 1, null, "", "reinforcement", "opponent_lock"],
	"Doppelganger": [null, "support", 1, null, "", "reinforcement", "opponent_support"],
	"Doppelganger.Sr": [null, "support", 1, null, "", "reinforcement", "opponent_support"],
	"DoubleDown": [null, "support", 1, "res://Scripts/Abilties/DoubleDown.gd", "+1 PL to 2 of your VT's.", "boost"],
	"DoubleDown.Sr": [null, "support", 1, "res://Scripts/Abilties/DoubleDown.gd", "+1 PL to 2 of your VT's.", "boost"],
	"BattleCry": [null, "support", 1, "res://Scripts/Abilties/BattleCry.gd", "Lock: If the attached VT has at least 11 PL, draw 1 card.", "ally"],
	"BattleCry.Sr": [null, "support", 1, "res://Scripts/Abilties/BattleCry.gd", "Lock: If the attached VT has at least 11 PL, draw 1 card.", "ally"],
	"Reaper": [null, "support", 1, null, "", "reinforcement", "opponent_support"],
	"Reaper.Sr": [null, "support", 1, null, "", "reinforcement", "opponent_support"],
}
