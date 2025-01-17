import 'package:cloud_firestore/cloud_firestore.dart';

class DossierModel {
  final String? id,
      nom,
      prenom,
      age,
      sexe,
      adresse,
      telephone,
      gouvernerat,
      couverture,
      cin,
      profession,
      antecFamil,
      preciserAntecFamil,
      preciserAntecPers,
      ancienDiabete,
      complDiabete,
      ancienHTA,
      preciserAllergie,
      traitHabAllerie,
      preciserOpere,
      menarche,
      age1ereRapp,
      nbIVG,
      allaitement,
      nbGrossesse,
      nbParite,
      nbEnfant,
      nbFaussCouche,
      nb1ereGross,
      preciserEnceinte,
      contraception,
      hormonale,
      activiteGinet,
      menopause,
      paquetAn,
      chichaAn,
      preciserDrogue,
      autreHabitude,
      histoire,
      diagnosticInit,
      auTotal,
      nomDoctor,
      specDoctor,
      idPatient;
  bool? checkPasAntecFam,
      checkAntecPerCanc,
      checkPasAntecMed,
      checkDiabete,
      checkHTA,
      checkCoronorpathie,
      checkCardiaque,
      checkRenal,
      checkHepatique,
      checkRespChr,
      checkAlergie,
      checkPasAntecChir,
      checkOpere,
      checkPasAntecGenObs,
      checkenceinte,
      checkPasHabitude,
      checkAlcool,
      checkTabac,
      checkChicha,
      checkDrogue;

  DossierModel({
    this.id = "",
    this.nom = "",
    this.prenom = "",
    this.age = "",
    this.sexe = "",
    this.adresse = "",
    this.telephone = "",
    this.gouvernerat = "",
    this.couverture = "",
    this.cin = "",
    this.profession = "",
    this.antecFamil = "",
    this.preciserAntecFamil = "",
    this.preciserAntecPers = "",
    this.ancienDiabete = "",
    this.complDiabete = "",
    this.ancienHTA = "",
    this.preciserAllergie = "",
    this.traitHabAllerie = "",
    this.preciserOpere = "",
    this.menarche = "",
    this.age1ereRapp = "",
    this.nbIVG = "",
    this.allaitement = "",
    this.nbGrossesse = "",
    this.nbParite = "",
    this.nbEnfant = "",
    this.nbFaussCouche = "",
    this.nb1ereGross = "",
    this.preciserEnceinte = "",
    this.contraception = "",
    this.hormonale = "",
    this.activiteGinet = "",
    this.menopause = "",
    this.paquetAn = "",
    this.chichaAn = "",
    this.preciserDrogue = "",
    this.autreHabitude = "",
    this.histoire = "",
    this.diagnosticInit = "",
    this.auTotal = "",
    this.nomDoctor = "",
    this.specDoctor = "",
    this.idPatient = "",
    this.checkPasAntecFam,
    this.checkAntecPerCanc,
    this.checkPasAntecMed,
    this.checkDiabete,
    this.checkHTA,
    this.checkCoronorpathie,
    this.checkCardiaque,
    this.checkRenal,
    this.checkHepatique,
    this.checkRespChr,
    this.checkAlergie,
    this.checkPasAntecChir,
    this.checkOpere,
    this.checkPasAntecGenObs,
    this.checkenceinte,
    this.checkPasHabitude,
    this.checkAlcool,
    this.checkTabac,
    this.checkChicha,
    this.checkDrogue,
  });
  DossierModel setId(String IdDossier) {
    return DossierModel(
      id: IdDossier,
      nom: this.nom,
      prenom: this.prenom,
      age: this.age,
      sexe: this.sexe,
      adresse: this.adresse,
      telephone: this.telephone,
      gouvernerat: this.gouvernerat,
      couverture: this.couverture,
      cin: this.cin,
      profession: this.profession,
      antecFamil: this.antecFamil,
      preciserAntecFamil: this.preciserAntecFamil,
      preciserAntecPers: this.preciserAntecPers,
      ancienDiabete: this.ancienDiabete,
      complDiabete: this.complDiabete,
      ancienHTA: this.ancienHTA,
      preciserAllergie: this.preciserAllergie,
      traitHabAllerie: this.traitHabAllerie,
      preciserOpere: this.preciserOpere,
      menarche: this.menarche,
      age1ereRapp: this.age1ereRapp,
      nbIVG: this.nbIVG,
      allaitement: this.allaitement,
      nbGrossesse: this.nbGrossesse,
      nbParite: this.nbParite,
      nbEnfant: this.nbEnfant,
      nbFaussCouche: this.nbFaussCouche,
      nb1ereGross: this.nb1ereGross,
      preciserEnceinte: this.preciserEnceinte,
      contraception: this.contraception,
      hormonale: this.hormonale,
      activiteGinet: this.activiteGinet,
      menopause: this.menopause,
      paquetAn: this.paquetAn,
      chichaAn: this.chichaAn,
      preciserDrogue: this.preciserDrogue,
      autreHabitude: this.autreHabitude,
      histoire: this.histoire,
      diagnosticInit: this.diagnosticInit,
      auTotal: this.auTotal,
      nomDoctor: this.nomDoctor,
      specDoctor: this.specDoctor,
      idPatient: this.idPatient,
      checkPasAntecFam: this.checkPasAntecFam,
      checkAntecPerCanc: this.checkAntecPerCanc,
      checkPasAntecMed: this.checkPasAntecMed,
      checkDiabete: this.checkDiabete,
      checkHTA: this.checkHTA,
      checkCoronorpathie: this.checkCoronorpathie,
      checkCardiaque: this.checkCardiaque,
      checkRenal: this.checkRenal,
      checkHepatique: this.checkHepatique,
      checkRespChr: this.checkRespChr,
      checkAlergie: this.checkAlergie,
      checkPasAntecChir: this.checkPasAntecChir,
      checkOpere: this.checkOpere,
      checkPasAntecGenObs: this.checkPasAntecGenObs,
      checkenceinte: this.checkenceinte,
      checkPasHabitude: this.checkPasHabitude,
      checkAlcool: this.checkAlcool,
      checkTabac: this.checkTabac,
      checkChicha: this.checkChicha,
      checkDrogue: this.checkDrogue,
    );
  }

  toJson() {
    return {
      "id": id,
      "nom": nom,
      "prenom": prenom,
      "age": age,
      "sexe": sexe,
      "adresse": adresse,
      "telephone": telephone,
      "gouvernerat": gouvernerat,
      "couverture": couverture,
      "cin": cin,
      "profession": profession,
      "antecFamil": antecFamil,
      "preciserAntecFamil": preciserAntecFamil,
      "preciserAntecPers": preciserAntecPers,
      "ancienDiabete": ancienDiabete,
      "complDiabete": complDiabete,
      "ancienHTA": ancienHTA,
      "preciserAllergie": preciserAllergie,
      "traitHabAllerie": traitHabAllerie,
      "preciserOpere": preciserOpere,
      "menarche": menarche,
      "age1ereRapp": age1ereRapp,
      "nbIVG": nbIVG,
      "allaitement": allaitement,
      "nbGrossesse": nbGrossesse,
      "nbParite": nbParite,
      "nbEnfant": nbEnfant,
      "nbFaussCouche": nbFaussCouche,
      "nb1ereGross": nb1ereGross,
      "preciserEnceinte": preciserEnceinte,
      "contraception": contraception,
      "hormonale": hormonale,
      "activiteGinet": activiteGinet,
      "menopause": menopause,
      "paquetAn": paquetAn,
      "chichaAn": chichaAn,
      "preciserDrogue": preciserDrogue,
      "autreHabitude": autreHabitude,
      "histoire": histoire,
      "diagnosticInit": diagnosticInit,
      "auTotal": auTotal,
      "nomDoctor": nomDoctor,
      "specDoctor": specDoctor,
      "idPatient": idPatient,
      "checkPasAntecFam": checkPasAntecFam,
      "checkAntecPerCanc": checkAntecPerCanc,
      "checkPasAntecMed": checkPasAntecMed,
      "checkDiabete": checkDiabete,
      "checkHTA": checkHTA,
      "checkCoronorpathie": checkCoronorpathie,
      "checkCardiaque": checkCardiaque,
      "checkRenal": checkRenal,
      "checkHepatique": checkHepatique,
      "checkRespChr": checkRespChr,
      "checkAlergie": checkAlergie,
      "checkPasAntecChir": checkPasAntecChir,
      "checkOpere": checkOpere,
      "checkPasAntecGenObs": checkPasAntecGenObs,
      "checkenceinte": checkenceinte,
      "checkPasHabitude": checkPasHabitude,
      "checkAlcool": checkAlcool,
      "checkTabac": checkTabac,
      "checkChicha": checkChicha,
      "checkDrogue": checkDrogue,
    };
  }

  factory DossierModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return DossierModel(
      id: data["id"],
      nom: data["nom"],
      prenom: data["prenom"],
      age: data["age"],
      sexe: data["sexe"],
      adresse: data["adresse"],
      telephone: data["telephone"],
      gouvernerat: data["gouvernerat"],
      couverture: data["couverture"],
      cin: data["cin"],
      profession: data["profession"],
      antecFamil: data["antecFamil"],
      preciserAntecFamil: data["preciserAntecFamil"],
      preciserAntecPers: data["preciserAntecPers"],
      ancienDiabete: data["ancienDiabete"],
      complDiabete: data["complDiabete"],
      ancienHTA: data["ancienHTA"],
      preciserAllergie: data["preciserAllergie"],
      traitHabAllerie: data["traitHabAllerie"],
      preciserOpere: data["preciserOpere"],
      menarche: data["menarche"],
      age1ereRapp: data["age1ereRapp"],
      nbIVG: data["nbIVG"],
      allaitement: data["allaitement"],
      nbGrossesse: data["nbGrossesse"],
      nbParite: data["nbParite"],
      nbEnfant: data["nbEnfant"],
      nbFaussCouche: data["nbFaussCouche"],
      nb1ereGross: data["nb1ereGross"],
      preciserEnceinte: data["preciserEnceinte"],
      contraception: data["contraception"],
      hormonale: data["hormonale"],
      activiteGinet: data["activiteGinet"],
      menopause: data["menopause"],
      paquetAn: data["paquetAn"],
      chichaAn: data["chichaAn"],
      preciserDrogue: data["preciserDrogue"],
      autreHabitude: data["autreHabitude"],
      histoire: data["histoire"],
      diagnosticInit: data["diagnosticInit"],
      auTotal: data["auTotal"],
      nomDoctor: data["nomDoctor"],
      specDoctor: data["specDoctor"],
      idPatient: data["idPatient"],
      checkPasAntecFam: data["checkPasAntecFam"],
      checkAntecPerCanc: data["checkAntecPerCanc"],
      checkPasAntecMed: data["checkPasAntecMed"],
      checkDiabete: data["checkDiabete"],
      checkHTA: data["checkHTA"],
      checkCoronorpathie: data["checkCoronorpathie"],
      checkCardiaque: data["checkCardiaque"],
      checkRenal: data["checkRenal"],
      checkHepatique: data["checkHepatique"],
      checkRespChr: data["checkRespChr"],
      checkAlergie: data["checkAlergie"],
      checkPasAntecChir: data["checkPasAntecChir"],
      checkOpere: data["checkOpere"],
      checkPasAntecGenObs: data["checkPasAntecGenObs"],
      checkenceinte: data["checkenceinte"],
      checkPasHabitude: data["checkPasHabitude"],
      checkAlcool: data["checkAlcool"],
      checkTabac: data["checkTabac"],
      checkChicha: data["checkChicha"],
      checkDrogue: data["checkDrogue"],
    );
  }
}
