import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/controllers/dossier_controller.dart';
import 'package:medconnectdoctor/models/dossier_model.dart';
import '../models/patient_model.dart';
import '../models/user_model.dart';
import '../theme/constants.dart';

class AjoutPatientStatiquePage extends StatefulWidget {
  const AjoutPatientStatiquePage({
    super.key,
    required this.usr,
    required this.patient,
  });
  final UserModel usr;
  final PatientModel patient;
  @override
  State<AjoutPatientStatiquePage> createState() =>
      _AjoutPatientStatiquePageState();
}

int currentStep = 0;

enum Gender { Homme, Femme }

final TextEditingController _nomController = new TextEditingController(),
    _prenomController = new TextEditingController(),
    _ageController = new TextEditingController(),
    _adresseController = new TextEditingController(),
    _telephoneController = new TextEditingController(),
    _gouvernartController = new TextEditingController(),
    _couvertureSocController = new TextEditingController(),
    _cinController = new TextEditingController(),
    _professionController = new TextEditingController(),
    _antecFamilController = new TextEditingController(),
    _preciserAntecFamilController = new TextEditingController(),
    _preciserAntePerscController = new TextEditingController(),
    _ancienneteDiabController = new TextEditingController(),
    _complicationDiabController = new TextEditingController(),
    _ancienneteHTAController = new TextEditingController(),
    _preciserAllergieController = new TextEditingController(),
    _traitHabitController = new TextEditingController(),
    _preciserOpereeController = new TextEditingController(),
    _menarcheController = new TextEditingController(),
    _age1erRapController = new TextEditingController(),
    _nbIVGController = new TextEditingController(),
    _allaitementController = new TextEditingController(),
    _nbGrossController = new TextEditingController(),
    _nbPariteController = new TextEditingController(),
    _nbEnfantVivController = new TextEditingController(),
    _nbFaussesCouchesController = new TextEditingController(),
    _nb1ereGrossesseController = new TextEditingController(),
    _preciserEnceinteController = new TextEditingController(),
    _contraceptionController = new TextEditingController(),
    _hormonaleController = new TextEditingController(),
    _activiteGenetalController = new TextEditingController(),
    _menopauseController = new TextEditingController(),
    _paquetsAnController = new TextEditingController(),
    _chichasAnController = new TextEditingController(),
    _preciserDrogueController = new TextEditingController(),
    _autreHabitudeController = new TextEditingController(),
    _histoireController = new TextEditingController(),
    _diagnosticController = new TextEditingController(),
    _totalController = new TextEditingController();

bool checkPasAntecFam = false;
bool checkAntecPerCanc = false;
bool checkPasAntecMed = false;
bool checkDiabete = false;
bool checkHTA = false;
bool checkCoronorpathie = false;
bool checkCardiaque = false;
bool checkRenal = false;
bool checkHepatique = false;
bool checkRespChr = false;
bool checkAlergie = false;
bool checkPasAntecChir = false;
bool checkOpere = false;
bool checkPasAntecGenObs = false;
bool checkenceinte = false;
bool checkPasHabitude = false;
bool checkAlcool = false;
bool checkTabac = false;
bool checkChicha = false;
bool checkDrogue = false;

bool satusCreatDossier = false;

class _AjoutPatientStatiquePageState extends State<AjoutPatientStatiquePage> {
  Gender? _selectedGender;
  String sexe = "";
  final controller = Get.put(DossierController());

  @override
  Widget build(BuildContext context) {
    List<Step> getSteps() => [
          Step(
            title: Text(""),
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Introduction ",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    controller: _nomController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _prenomController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Prénom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _ageController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: kLightBlueColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: Gender.Homme,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value as Gender;
                              sexe = "Homme";
                            });
                          },
                        ),
                        Text('Homme'),
                        SizedBox(
                            width: 20), // Espacement entre les boutons radio
                        Radio(
                          value: Gender.Femme,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value as Gender;
                              sexe = "Femme";
                            });
                          },
                        ),
                        Text('Femme'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _adresseController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Adresse",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _telephoneController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Téléphone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _gouvernartController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Gouvernerat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _couvertureSocController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Couverture social",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _cinController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "CIN",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _professionController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Profession",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Antécédents familiaux",
                    style: Theme.of(context).textTheme.headline3!,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                            title: Expanded(
                              child: Text("Pas d’antécédents familiaux",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith()),
                            ),
                            value: checkPasAntecFam,
                            onChanged: (value) {
                              setState(() {
                                checkPasAntecFam = value!;
                              });
                            }),
                        TextFormField(
                          controller: _antecFamilController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Antécédents familiaux (0, 1, 2, 3)",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _preciserAntecFamilController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Si oui, Préciser :",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        SizedBox(height: 10),
                        CheckboxListTile(
                            title: Expanded(
                              child: Text("Antécédents personnels de cancer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith()),
                            ),
                            value: checkAntecPerCanc,
                            onChanged: (value) {
                              setState(() {
                                checkAntecPerCanc = value!;
                              });
                            }),
                        TextFormField(
                          controller: _preciserAntePerscController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Si oui, Préciser :",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Antécédents médicaux",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Pas d’antécédents médicaux",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkPasAntecMed,
                      onChanged: (value) {
                        setState(() {
                          checkPasAntecMed = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Diabéte",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkDiabete,
                      onChanged: (value) {
                        setState(() {
                          checkDiabete = value!;
                        });
                      }),
                  TextFormField(
                    controller: _ancienneteDiabController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Ancienneté (ans)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _complicationDiabController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Complications",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("HTA",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkHTA,
                      onChanged: (value) {
                        setState(() {
                          checkHTA = value!;
                        });
                      }),
                  TextFormField(
                    controller: _ancienneteHTAController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Ancienneté (ans)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Coronaropathie",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkCoronorpathie,
                      onChanged: (value) {
                        setState(() {
                          checkCoronorpathie = value!;
                        });
                      }),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    "Insuffisances :",
                    style: Theme.of(context).textTheme.headline5!.copyWith(),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Cardiaque",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkCardiaque,
                      onChanged: (value) {
                        setState(() {
                          checkCardiaque = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Rénale",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkRenal,
                      onChanged: (value) {
                        setState(() {
                          checkRenal = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Hépatique",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkHepatique,
                      onChanged: (value) {
                        setState(() {
                          checkHepatique = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Resp.Chr",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkRespChr,
                      onChanged: (value) {
                        setState(() {
                          checkRespChr = value!;
                        });
                      }),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Allergie",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkAlergie,
                      onChanged: (value) {
                        setState(() {
                          checkAlergie = value!;
                        });
                      }),
                  TextFormField(
                    controller: _preciserAllergieController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Si oui, Préciser :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _traitHabitController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Traitement Habituel",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Antécédents chirurgicaux",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Pas d’antécédents chirurgicaux",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkPasAntecChir,
                      onChanged: (value) {
                        setState(() {
                          checkPasAntecChir = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Opéré(e)",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkOpere,
                      onChanged: (value) {
                        setState(() {
                          checkOpere = value!;
                        });
                      }),
                  TextFormField(
                    controller: _preciserOpereeController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Si oui, Préciser :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 4 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 4,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Antécédents gynéco-obstetricaux",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Pas d’antécédents gynéco-obstetricaux",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkPasAntecGenObs,
                      onChanged: (value) {
                        setState(() {
                          checkPasAntecGenObs = value!;
                        });
                      }),
                  TextFormField(
                    controller: _menarcheController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Menarche",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _age1erRapController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Age 1er rapport",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nbIVGController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb IVG",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _allaitementController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Allaitement(nb/M)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nbGrossController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb de grossesses",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nbPariteController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb Parité",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nbEnfantVivController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb enfants Vivants",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nbFaussesCouchesController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb fausses couches",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nb1ereGrossesseController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb 1ere grossesse à terme",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Enceinte",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkenceinte,
                      onChanged: (value) {
                        setState(() {
                          checkenceinte = value!;
                        });
                      }),
                  TextFormField(
                    controller: _preciserEnceinteController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Si oui, Préciser le terme :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _contraceptionController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Contraception",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _hormonaleController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Si Hormonale, à préciser (Nb M)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _activiteGenetalController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Activités Ginétales",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _menarcheController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Menopause depuis(Age)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 5 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 5,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Habitudes",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Pas d’habitudes",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith()),
                      ),
                      value: checkPasHabitude,
                      onChanged: (value) {
                        setState(() {
                          checkPasHabitude = value!;
                        });
                      }),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Alcool",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkAlcool,
                      onChanged: (value) {
                        setState(() {
                          checkAlcool = value!;
                        });
                      }),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Tabac",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkTabac,
                      onChanged: (value) {
                        setState(() {
                          checkTabac = value!;
                        });
                      }),
                  TextFormField(
                    controller: _paquetsAnController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "paquets/an",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Chicha",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkChicha,
                      onChanged: (value) {
                        setState(() {
                          checkChicha = value!;
                        });
                      }),
                  TextFormField(
                    controller: _chichasAnController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "chichas/an",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Drogue",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith()),
                      ),
                      value: checkDrogue,
                      onChanged: (value) {
                        setState(() {
                          checkDrogue = value!;
                        });
                      }),
                  TextFormField(
                    controller: _preciserDrogueController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Préciser",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _autreHabitudeController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Autres habitudes :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 6 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 6,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Histoire de la maladie",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _histoireController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Histoire",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _diagnosticController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Diagnostic initial",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: Text(""),
            state: currentStep > 7 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 7,
            content: Container(
              child: Column(
                children: [
                  Text(
                    "Au total",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _totalController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Au total",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ];
    final isLastStep = currentStep == getSteps().length - 1;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Image.asset(
              "assets/images/appbar_image.png",
              height: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Theme(
          data: Theme.of(context)
              .copyWith(colorScheme: ColorScheme.light(primary: kBlueColor)),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () async {
              if (isLastStep) {
                final dossier = DossierModel(
                  nom: _nomController.text.trim(),
                  prenom: _prenomController.text.trim(),
                  age: _ageController.text.trim(),
                  sexe: sexe,
                  adresse: _adresseController.text.trim(),
                  telephone: _telephoneController.text.trim(),
                  gouvernerat: _gouvernartController.text.trim(),
                  couverture: _couvertureSocController.text.trim(),
                  cin: _cinController.text.trim(),
                  profession: _professionController.text.trim(),
                  antecFamil: _antecFamilController.text.trim(),
                  preciserAntecFamil: _preciserAntecFamilController.text.trim(),
                  preciserAntecPers: _preciserAntePerscController.text.trim(),
                  ancienDiabete: _ancienneteDiabController.text.trim(),
                  complDiabete: _complicationDiabController.text.trim(),
                  ancienHTA: _ancienneteHTAController.text.trim(),
                  preciserAllergie: _preciserAllergieController.text.trim(),
                  traitHabAllerie: _traitHabitController.text.trim(),
                  preciserOpere: _preciserOpereeController.text.trim(),
                  menarche: _menarcheController.text.trim(),
                  age1ereRapp: _age1erRapController.text.trim(),
                  nbIVG: _nbIVGController.text.trim(),
                  allaitement: _allaitementController.text.trim(),
                  nbGrossesse: _nbGrossController.text.trim(),
                  nbParite: _nbPariteController.text.trim(),
                  nbEnfant: _nbEnfantVivController.text.trim(),
                  nbFaussCouche: _nbFaussesCouchesController.text.trim(),
                  nb1ereGross: _nb1ereGrossesseController.text.trim(),
                  preciserEnceinte: _preciserEnceinteController.text.trim(),
                  contraception: _contraceptionController.text.trim(),
                  hormonale: _hormonaleController.text.trim(),
                  activiteGinet: _activiteGenetalController.text.trim(),
                  menopause: _menopauseController.text.trim(),
                  paquetAn: _paquetsAnController.text.trim(),
                  chichaAn: _chichasAnController.text.trim(),
                  preciserDrogue: _preciserDrogueController.text.trim(),
                  autreHabitude: _autreHabitudeController.text.trim(),
                  histoire: _histoireController.text.trim(),
                  diagnosticInit: _diagnosticController.text.trim(),
                  auTotal: _totalController.text.trim(),
                  nomDoctor: widget.usr.fullName,
                  specDoctor: widget.usr.specialite,
                  idPatient: widget.patient.id,
                  checkPasAntecFam: checkPasAntecFam,
                  checkAntecPerCanc: checkAntecPerCanc,
                  checkPasAntecMed: checkPasAntecMed,
                  checkDiabete: checkDiabete,
                  checkHTA: checkHTA,
                  checkCoronorpathie: checkCoronorpathie,
                  checkCardiaque: checkCardiaque,
                  checkRenal: checkRenal,
                  checkHepatique: checkHepatique,
                  checkRespChr: checkRespChr,
                  checkAlergie: checkAlergie,
                  checkPasAntecChir: checkPasAntecChir,
                  checkOpere: checkOpere,
                  checkPasAntecGenObs: checkPasAntecGenObs,
                  checkenceinte: checkenceinte,
                  checkPasHabitude: checkPasHabitude,
                  checkAlcool: checkAlcool,
                  checkTabac: checkTabac,
                  checkChicha: checkChicha,
                  checkDrogue: checkDrogue,
                );

                controller.createDossierController(
                    dossier, widget.patient.id!, widget.usr.id!);

                Navigator.pop(context);
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepCancel: () =>
                currentStep == 0 ? null : setState(() => currentStep -= 1),
            onStepTapped: (step) => setState(() => currentStep = step),
            controlsBuilder: (context, detail) {
              return Container(
                //margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    if (currentStep != 0)
                      Expanded(
                          child: ElevatedButton(
                              onPressed: detail.onStepCancel,
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor: kBlueColor,
                              ),
                              child: Text(
                                "Retour",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ))),
                    currentStep != 0 ? SizedBox(width: 10) : SizedBox(width: 0),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: kBlueColor,
                        ),
                        onPressed: detail.onStepContinue,
                        child: Text(
                          isLastStep ? "Confirmé" : "Suivant",
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
