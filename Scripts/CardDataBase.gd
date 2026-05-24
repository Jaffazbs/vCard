const CARDS = {
	# ================= SINDER =================
	"Sinder.Pl10": [69, "vt", 10, null, "Age: 14,009\nHeight: 5'5.5\nWeight: 123 lbs\nType: Fire\nStrength: Grass\nWeakness: Water\nWhen at her lowest, the dormant demonic energies within Sinder awoke, transforming her into her most powerful form."],
	"Sinder.Pl9": [68, "vt", 9, null, "Age: 14,009\nHeight: 5'5.5\nWeight: 123 lbs\nType: Fire\nStrength: Grass\nWeakness: Water\nA fiery wolf girl who was banished from Hell and cursed to be a half hellhound, half human 'monster'."],
	"Sinder.Pl8": [67, "vt", 8, "res://Scripts/Abilties/Sinder.gd", "Age: 14,009\nHeight: 5'5.5\nWeight: 123 lbs\nType: Fire\nStrength: Grass\nWeakness: Water\nSnap: +1 PL to Target VT, you may draw a card if it's a PL9 or PL10 VT."],
	"Sinder.Pl10.Gr": [null, "vt", 10, null, ""],
	"PyroPup": [149, "mascot", 0, null, "Age: Unknown\nHeight: Unknown\nWeight: Unknown\nEcho: -1 PL to target Backstage VT.\n+1 PL to Fire type VTs\n+1 PL to Sinder"],

	# ================= SHYLILY =================
	"Shylily.Pl10": [24, "vt", 10, null, ""],
	"Shylily.Pl9": [23, "vt", 9, null, ""],
	"Shylily.Pl8": [22, "vt", 8, null, ""],
	"Shylily.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= MONARCH =================
	"Monarch.Pl9": [null, "vt", 9, null, ""],
	"Monarch.Pl8": [null, "vt", 8, null, ""],
	"MultiverseMonarch.Pl10": [null, "vt", 10, null, ""],
	"MultiverseMonarch.Pl10.Gr": [null, "vt", 10, null, ""],
	"MonarchMessengerClone": [null, "mascot", 0, null, ""],

	# ================= BAO THE WHALE =================
	"BaoTheWhale.Pl10": [null, "vt", 10, null, ""],
	"BaoTheWhale.Pl9": [null, "vt", 9, null, ""],
	"BaoTheWhale.Pl8": [null, "vt", 8, null, ""],
	"BaoTheWhale.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= EBIKO =================
	"Ebiko.Pl10": [null, "vt", 10, null, ""],
	"Ebiko.Pl9": [null, "vt", 9, null, ""],
	"Ebiko.Pl8": [null, "vt", 8, null, ""],
	"Ebiko.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= FOXYREINE =================
	"Foxyreine.Pl10": [null, "vt", 10, null, ""],
	"Foxyreine.Pl9": [null, "vt", 9, null, ""],
	"Foxyreine.Pl8": [null, "vt", 8, null, ""],
	"Foxyreine.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= FROGGYLOCH =================
	"Froggyloch.Pl10": [null, "vt", 10, null, ""],
	"Froggyloch.Pl9": [null, "vt", 9, null, ""],
	"Froggyloch.Pl8": [null, "vt", 8, null, ""],
	"Froggyloch.Pl10.Gr": [null, "vt", 10, null, ""],
	"Froglodyte": [null, "mascot", 0, null, ""],

	# ================= MEGALODONVT =================
	"Megalodonvt.Pl10": [null, "vt", 10, null, ""],
	"Megalodonvt.Pl9": [null, "vt", 9, null, ""],
	"Megalodonvt.Pl8": [null, "vt", 8, null, ""],
	"Megalodonvt.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= NYANNERS =================
	"Nyanners.Pl10": [null, "vt", 10, null, ""],
	"Nyanners.Pl9": [null, "vt", 9, null, ""],
	"Nyanners.Pl8": [null, "vt", 8, null, ""],
	"Nyanners.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= BUFFPUP =================
	"Buffpup.Pl10": [null, "vt", 10, null, ""],
	"Buffpup.Pl9": [null, "vt", 9, null, ""],
	"Buffpup.Pl8": [null, "vt", 8, null, ""],
	"Buffpup.Pl10.Gr": [null, "vt", 10, null, ""],
	"Pup": [null, "mascot", 0, null, ""],

	# ================= EVIL BUFFPUP =================
	"EvilBuffpup.Pl10": [null, "vt", 10, null, ""],
	"EvilBuffpup.Pl9": [null, "vt", 9, null, ""],
	"EvilBuffpup.Pl8": [null, "vt", 8, null, ""],
	"EvilBuffpup.Pl10.Gr": [null, "vt", 10, null, ""],
	"Evilbot": [null, "mascot", 0, null, ""],

	# ================= COQUI =================
	"Coqui.Pl10": [null, "vt", 10, null, ""],
	"Coqui.Pl9": [null, "vt", 9, null, ""],
	"Coqui.Pl8": [null, "vt", 8, null, ""],
	"Coqui.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= DOKIBIRD =================
	"Dokibird.Pl10": [null, "vt", 10, null, ""],
	"Dokibird.Pl10.Gr": [null, "vt", 10, null, ""],
	"DokisTrueForm.Pl9": [null, "vt", 9, null, ""],
	"DokisTrueForm.Pl8": [null, "vt", 8, null, ""],

	# ================= LAIMU =================
	"Laimu.Pl10": [null, "vt", 10, null, ""],
	"Laimu.Pl9": [null, "vt", 9, null, ""],
	"Laimu.Pl8": [null, "vt", 8, null, ""],
	"Laimu.Pl10.Gr": [null, "vt", 10, null, ""],
	"Limon": [null, "mascot", 0, null, ""],

	# ================= MEAT =================
	"Meat.Pl10": [null, "vt", 10, null, ""],
	"Meat.Pl9": [null, "vt", 9, null, ""],
	"Meat.Pl8": [null, "vt", 8, null, ""],
	"Meat.Pl10.Gr": [null, "vt", 10, null, ""],
	"Meathead": [null, "mascot", 0, null, ""],

	# ================= SILVERVALE =================
	"Silvervale.Pl10": [null, "vt", 10, null, ""],
	"Silvervale.Pl9": [null, "vt", 9, null, ""],
	"Silvervale.Pl8": [null, "vt", 8, null, ""],
	"Silvervale.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= TOB =================
	"Tob.Pl10": [null, "vt", 10, null, ""],
	"Tob.Pl9": [null, "vt", 9, null, ""],
	"Tob.Pl8": [null, "vt", 8, null, ""],
	"Tob.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= FARMER VIENNA =================
	"FarmerVienna.Pl10": [null, "vt", 10, null, ""],
	"FarmerVienna.Pl9": [null, "vt", 9, null, ""],
	"FarmerVienna.Pl8": [null, "vt", 8, null, ""],
	"FarmerVienna.Pl10.Gr": [null, "vt", 10, null, ""],
	"FarmerCosmate": [null, "mascot", 0, null, ""],

	# ================= FEFE =================
	"Fefe.Pl10": [null, "vt", 10, null, ""],
	"Fefe.Pl9": [null, "vt", 9, null, ""],
	"Fefe.Pl8": [null, "vt", 8, null, ""],
	"Fefe.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= LORD AETHELSTAN =================
	"LordAethelstan.Pl10": [null, "vt", 10, null, ""],
	"LordAethelstan.Pl9": [null, "vt", 9, null, ""],
	"LordAethelstan.Pl8": [null, "vt", 8, null, ""],
	"LordAethelstan.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= NUMI / NIHMUNE =================
	"UniversityNumi.Pl8": [null, "vt", 8, null, ""],
	"UniversityNumi.Pl9": [null, "vt", 9, null, ""],
	"Nihmune.Pl10": [null, "vt", 10, null, ""],
	"Nihmune.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= PUNKALOPI =================
	"Punkalopi.Pl10": [null, "vt", 10, null, ""],
	"Punkalopi.Pl9": [null, "vt", 9, null, ""],
	"Punkalopi.Pl8": [null, "vt", 8, null, ""],
	"Punkalopi.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= AKUMI =================
	"Akumi.Pl10": [null, "vt", 10, null, ""],
	"Akumi.Pl9": [null, "vt", 9, null, ""],
	"Akumi.Pl8": [null, "vt", 8, null, ""],
	"Akumi.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= TRICKYWI =================
	"PirateTrickywi.Pl9": [null, "vt", 9, null, ""],
	"PirateTrickywi.Pl8": [null, "vt", 8, null, ""],
	"PharaohNephasis.Pl10": [null, "vt", 10, null, ""],
	"PharaohNephasis.Pl10.Gr": [null, "vt", 10, null, ""],
	"Tricky": [null, "mascot", 0, null, ""],

	# ================= YUZU =================
	"Yuzu.Pl10": [null, "vt", 10, null, ""],
	"Yuzu.Pl9": [null, "vt", 9, null, ""],
	"Yuzu.Pl8": [null, "vt", 8, null, ""],
	"Yuzu.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= CODEMIKO =================
	"Codemiko.Pl10": [null, "vt", 10, null, ""],
	"Codemiko.Pl9": [null, "vt", 9, null, ""],
	"Codemiko.Pl8": [null, "vt", 8, null, ""],
	"Codemiko.Pl10.Gr": [null, "vt", 10, null, ""],
	"Droid": [null, "mascot", 0, null, ""],

	# ================= COTTONTAILVA =================
	"CottontailVA.Pl10.Dc": [null, "vt", 10, null, ""],
	"CottontailVA.Pl10.Dc.Gr": [null, "vt", 10, null, ""],
	"Cottontailva.Pl9": [null, "vt", 9, null, ""],
	"Cottontailva.Pl8": [null, "vt", 8, null, ""],
	"Cottontailva.Pl10.Gr": [null, "vt", 10, null, ""],
	"Fluffer": [null, "mascot", 0, null, ""],

	# ================= CYYU =================
	"CyYu.Pl10": [null, "vt", 10, null, ""],
	"CyYu.Pl9": [null, "vt", 9, null, ""],
	"CyYu.Pl8": [null, "vt", 8, null, ""],
	"CyYu.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= JUNIPER ACTIAS =================
	"JuniperActias.Pl10": [null, "vt", 10, null, ""],
	"JuniperActias.Pl9": [null, "vt", 9, null, ""],
	"JuniperActias.Pl8": [null, "vt", 8, null, ""],
	"JuniperActias.Pl10.Gr": [null, "vt", 10, null, ""],
	"BabyMoth": [null, "mascot", 0, null, ""],

	# ================= LUCY PYRE =================
	"LucyPyre.Pl10": [null, "vt", 10, null, ""],
	"LucyPyre.Pl9": [null, "vt", 9, null, ""],
	"LucyPyre.Pl8": [null, "vt", 8, null, ""],
	"LucyPyre.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= QUINN BENET =================
	"QuinnBenet.Pl10": [null, "vt", 10, null, ""],
	"QuinnBenet.Pl9": [null, "vt", 9, null, ""],
	"QuinnBenet.Pl8": [null, "vt", 8, null, ""],
	"QuinnBenet.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= RAINHOE =================
	"Rainhoe.Pl10": [null, "vt", 10, null, ""],
	"Rainhoe.Pl9": [null, "vt", 9, null, ""],
	"Rainhoe.Pl8": [null, "vt", 8, null, ""],
	"Rainhoe.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= SKY =================
	"Sky.Pl10": [null, "vt", 10, null, ""],
	"Sky.Pl9": [null, "vt", 9, null, ""],
	"Sky.Pl8": [null, "vt", 8, null, ""],
	"Sky.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= SHOTO =================
	"Shoto.Pl10": [null, "vt", 10, null, ""],
	"Shoto.Pl9": [null, "vt", 9, null, ""],
	"Shoto.Pl8": [null, "vt", 8, null, ""],
	"Shoto.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= CAMILA =================
	"Camila.Pl10": [null, "vt", 10, null, ""],
	"Camila.Pl9": [null, "vt", 9, null, ""],
	"Camila.Pl8": [null, "vt", 8, null, ""],
	"Camila.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= DYA RIKKU / DYANTE =================
	"DyaRikku.Pl9": [null, "vt", 9, null, ""],
	"DyaRikku.Pl8": [null, "vt", 8, null, ""],
	"Dyante.Pl10": [null, "vt", 10, null, ""],
	"Dyante.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= FREAM =================
	"Fream.Pl10": [null, "vt", 10, null, ""],
	"Fream.Pl9": [null, "vt", 9, null, ""],
	"Fream.Pl8": [null, "vt", 8, null, ""],
	"Fream.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= HEAVENLY FATHER =================
	"HeavenlyFather.Pl10": [null, "vt", 10, null, ""],
	"HeavenlyFather.Pl9": [null, "vt", 9, null, ""],
	"HeavenlyFather.Pl8": [null, "vt", 8, null, ""],
	"HeavenlyFather.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= LAYNA LAZAR =================
	"LaynaLazar.Pl10": [null, "vt", 10, null, ""],
	"LaynaLazar.Pl9": [null, "vt", 9, null, ""],
	"LaynaLazar.Pl8": [null, "vt", 8, null, ""],
	"LaynaLazar.Pl10.Gr": [null, "vt", 10, null, ""],
	"ChibiLayna": [null, "mascot", 0, null, ""],

	# ================= NANOLESS =================
	"Nanoless.Pl10": [null, "vt", 10, null, ""],
	"Nanoless.Pl9": [null, "vt", 9, null, ""],
	"Nanoless.Pl8": [null, "vt", 8, null, ""],
	"Nanoless.Pl10.Gr": [null, "vt", 10, null, ""],
	"Nanomono": [null, "mascot", 0, null, ""],

	# ================= SANSIN =================
	"Sansin.Pl10": [null, "vt", 10, null, ""],
	"Sansin.Pl9": [null, "vt", 9, null, ""],
	"Sansin.Pl8": [null, "vt", 8, null, ""],
	"Sansin.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= TOTLESS =================
	"Totless.Pl10": [null, "vt", 10, null, ""],
	"Totless.Pl9": [null, "vt", 9, null, ""],
	"Totless.Pl8": [null, "vt", 8, null, ""],
	"Totless.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= VEI =================
	"Vei.Pl10": [null, "vt", 10, null, ""],
	"Vei.Pl9": [null, "vt", 9, null, ""],
	"Vei.Pl8": [null, "vt", 8, null, ""],
	"Vei.Pl10.Gr": [null, "vt", 10, null, ""],

	# ================= KAIRYU CROCODILE =================
	"KairyuCrocodile.Pl10": [null, "vt", 10, null, ""],
	"KairyuCrocodile.Pl9": [null, "vt", 9, null, ""],
	"KairyuCrocodile.Pl8": [null, "vt", 8, null, ""],
	"KairyuCrocodile.Pl10.Gr": [null, "vt", 10, null, ""],
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
	"FireGuardian": [null, "support", 1, null, "", "boost"],
	"WaterGuardian": [null, "support", 1, null, "", "boost"],
	"GrassGuardian": [null, "support", 1, null, "", "boost"],
	"ElectricGuardian": [null, "support", 1, null, "", "boost"],
	"PlatinumGuardian": [null, "support", 1, null, "", "boost"],
	"Harpoon": [null, "support", 1, "res://Scripts/Abilties/Harpoon.gd", "-3 PL to Shylily's VT.", "boost"],
	"Harpoon.Sr": [null, "support", 1, "res://Scripts/Abilties/Harpoon.gd", "-3 PL to Shylily's VT.", "boost"],
	"CyanideChan": [null, "support", 1, "res://Scripts/Abilties/CyanideChan.gd", "+1 PL. Lock: If Happiness-Chan is attached to this VT, discard the top card of your Opp's deck.", "ally"],
	"CyanideChan.Sr": [null, "support", 1, "res://Scripts/Abilties/CyanideChan.gd", "+1 PL. Lock: If Happiness-Chan is attached to this VT, discard the top card of your Opp's deck.", "ally"],
	"HappinessChan": [null, "support", 1, "res://Scripts/Abilties/HappinessChan.gd", "+1 PL. Lock: If Cyanide-Chan is attached to this VT, draw 1 card.", "ally"],
	"HappinessChan.Sr": [null, "support", 1, "res://Scripts/Abilties/HappinessChan.gd", "+1 PL. Lock: If Cyanide-Chan is attached to this VT, draw 1 card.", "ally"],
	"SnackCat": [null, "support", 1, null, "", "ally"],
	"SnackCat.Sr": [null, "support", 1, null, "", "ally"],
	"WorkLifeBalance": [null, "support", 1, null, "", "ally"],
	"WorkLifeBalance.Sr": [null, "support", 1, null, "", "ally"],
	"WhiteKnight": [null, "support", 1, null, "", "ally"],
	"WhiteKnight.Sr": [null, "support", 1, null, "", "ally"],
	"ButchersBlade": [null, "support", 1, null, "", "ally"],
	"ButchersBlade.Sr": [null, "support", 1, null, "", "ally"],
	"Doppelganger": [null, "support", 1, null, "", "boost"],
	"Doppelganger.Sr": [null, "support", 1, null, "", "boost"],
	"DoubleDown": [null, "support", 1, "res://Scripts/Abilties/DoubleDown.gd", "+1 PL to 2 of your VT's.", "boost"],
	"DoubleDown.Sr": [null, "support", 1, "res://Scripts/Abilties/DoubleDown.gd", "+1 PL to 2 of your VT's.", "boost"],
	"BattleCry": [null, "support", 1, "res://Scripts/Abilties/BattleCry.gd", "Lock: If the attached VT has at least 11 PL, draw 1 card.", "ally"],
	"BattleCry.Sr": [null, "support", 1, "res://Scripts/Abilties/BattleCry.gd", "Lock: If the attached VT has at least 11 PL, draw 1 card.", "ally"],
	"Reaper": [null, "support", 1, null, "", "boost"],
	"Reaper.Sr": [null, "support", 1, null, "", "boost"],
}
