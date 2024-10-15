import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dossier_controller.dart';
import '../models/dossier_model.dart';
import '../theme/constants.dart';
import 'envoyer_dossier_mail.dart';

class DossierPatientPage extends StatefulWidget {
  const DossierPatientPage({super.key, required this.dossier});
  final DossierModel dossier;

  @override
  State<DossierPatientPage> createState() => _DossierPatientPageState();
}

int currentStep = 0;

class _DossierPatientPageState extends State<DossierPatientPage> {
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
                    "Introduction",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  TextResume(title: "Nom :", subtitle: widget.dossier.nom),
                  Divider(),
                  TextResume(
                      title: "Prenom :", subtitle: widget.dossier.prenom),
                  Divider(),
                  TextResume(title: "Sexe", subtitle: widget.dossier.sexe),
                  Divider(),
                  TextResume(
                      title: "Adresse", subtitle: widget.dossier.adresse),
                  Divider(),
                  TextResume(
                      title: "Téléphone", subtitle: widget.dossier.telephone),
                  Divider(),
                  TextResume(
                      title: "Gouvernerat",
                      subtitle: widget.dossier.gouvernerat),
                  Divider(),
                  TextResume(
                      title: "Couverture Social",
                      subtitle: widget.dossier.couverture),
                  Divider(),
                  TextResume(title: "CIN", subtitle: widget.dossier.cin),
                  Divider(),
                  TextResume(
                      title: "Profession", subtitle: widget.dossier.profession),
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
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.dossier.checkPasAntecFam == true)
                    TextResume(
                        title: "Pas d'antécéndent familiaux", subtitle: ""),
                  if (widget.dossier.checkPasAntecFam == false)
                    TextResume(
                        title: "Nb des antecedents familiaux :",
                        subtitle: widget.dossier.antecFamil),
                  if (widget.dossier.checkPasAntecFam == false)
                    TextLongResume(
                        title: "Les antécédents familiaux :",
                        subtitle: widget.dossier.preciserAntecFamil),
                  Divider(),
                  if (widget.dossier.checkAntecPerCanc == true)
                    TextResume(
                        title: "Antécedents personnels de cancer :",
                        subtitle:
                            widget.dossier.checkAntecPerCanc! ? "Oui" : "Non"),
                  if (widget.dossier.checkAntecPerCanc == true)
                    TextLongResume(
                        title: "Les antécédents personnels de cancer :",
                        subtitle: widget.dossier.preciserAntecFamil),
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
                  if (widget.dossier.checkPasAntecMed == true)
                    TextResume(
                        title: "Pas d'antécéndents medicaux ", subtitle: ""),
                  TextResume(
                      title: "Diabéte :",
                      subtitle: widget.dossier.checkDiabete! ? "Oui" : "Non"),
                  if (widget.dossier.checkDiabete == true)
                    TextResume(
                        title: "Ancienneté diabéte (Ans) :",
                        subtitle: widget.dossier.ancienDiabete),
                  if (widget.dossier.checkDiabete == true)
                    TextResume(
                        title: "Complications diabéte :",
                        subtitle: widget.dossier.complDiabete),
                  Divider(),
                  TextResume(
                      title: "HTA :",
                      subtitle: widget.dossier.checkHTA! ? "Oui" : "Non"),
                  if (widget.dossier.checkHTA == true)
                    TextResume(
                        title: "Ancienneté HTA :",
                        subtitle: widget.dossier.ancienHTA),
                  Divider(),
                  TextResume(
                      title: "Coronaropathie :",
                      subtitle:
                          widget.dossier.checkCoronorpathie! ? "Oui" : "Non"),
                  Divider(),
                  Text(
                    "Insuffisances",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  TextResume(
                      title: "Cardiaque :",
                      subtitle: widget.dossier.checkCardiaque! ? "Oui" : "Non"),
                  TextResume(
                      title: "Rénale :",
                      subtitle: widget.dossier.checkRenal! ? "Oui" : "Non"),
                  TextResume(
                      title: "Hépatique :",
                      subtitle: widget.dossier.checkHepatique! ? "Oui" : "Non"),
                  TextResume(
                      title: "Resp.Chr :",
                      subtitle: widget.dossier.checkRespChr! ? "Oui" : "Non"),
                  Divider(),
                  TextResume(
                      title: "Allergie :",
                      subtitle: widget.dossier.checkAlergie! ? "Oui" : "Non"),
                  if (widget.dossier.checkAlergie == true)
                    TextResume(
                        title: "Les Allergies :",
                        subtitle: widget.dossier.preciserAllergie),
                  if (widget.dossier.checkAlergie == true)
                    TextResume(
                        title: "Traitement Habituel :",
                        subtitle: widget.dossier.traitHabAllerie),
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
                    "Antécédents Chirurgicaux",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.dossier.checkPasAntecChir == true)
                    TextResume(
                        title: "Pas d'antécéndents Chirurgicaux ",
                        subtitle: ""),
                  TextResume(
                      title: "Opéré(e) :",
                      subtitle: widget.dossier.checkOpere! ? "Oui" : "Non"),
                  TextLongResume(
                      title: "Les opérations :",
                      subtitle: widget.dossier.preciserOpere)
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
                    "Antécéndents gynéco-obstetricaux",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.dossier.checkPasAntecGenObs == true)
                    TextResume(
                        title: "Pas d'antécéndents gynéco-obstetricaux",
                        subtitle: ""),
                  TextResume(
                      title: "Menarche :", subtitle: widget.dossier.menarche),
                  TextResume(
                      title: "Age 1er rapport :",
                      subtitle: widget.dossier.age1ereRapp),
                  TextResume(title: "Nb IVG :", subtitle: widget.dossier.nbIVG),
                  TextResume(
                      title: "Allaitement(nb/M) :",
                      subtitle: widget.dossier.allaitement),
                  TextResume(
                      title: "Nb de grossesses :",
                      subtitle: widget.dossier.nbGrossesse),
                  TextResume(
                      title: "Nb Parité :", subtitle: widget.dossier.nbParite),
                  TextResume(
                      title: "Nb Enfants Vivants :",
                      subtitle: widget.dossier.nbEnfant),
                  TextResume(
                      title: "Nb Fausses couches :",
                      subtitle: widget.dossier.nbFaussCouche),
                  Divider(),
                  TextResume(
                      title: "Enceinte :",
                      subtitle: widget.dossier.checkenceinte! ? "Oui" : "Non"),
                  TextResume(
                      title: "Le terme :",
                      subtitle: widget.dossier.preciserEnceinte),
                  TextResume(
                      title: "Contraception :",
                      subtitle: widget.dossier.contraception),
                  TextResume(
                      title: "Hormonale(Nb/M) :",
                      subtitle: widget.dossier.hormonale),
                  TextResume(
                      title: "Activités Ginétales :",
                      subtitle: widget.dossier.activiteGinet),
                  TextResume(
                      title: "Menopause depuis (Age) :",
                      subtitle: widget.dossier.menopause),
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
                  if (widget.dossier.checkPasHabitude == true)
                    TextResume(title: "Pas d'habitudes", subtitle: ""),
                  TextResume(
                      title: "Alcool :",
                      subtitle: widget.dossier.checkAlcool! ? "Oui" : "Non"),
                  Divider(),
                  TextResume(
                      title: "Tabac :",
                      subtitle: widget.dossier.checkTabac! ? "Oui" : "Non"),
                  TextResume(
                      title: "Paquet/an :", subtitle: widget.dossier.paquetAn),
                  Divider(),
                  TextResume(
                      title: "Chicha :",
                      subtitle: widget.dossier.checkChicha! ? "Oui" : "Non"),
                  TextResume(
                      title: "Chicha/an :", subtitle: widget.dossier.chichaAn),
                  Divider(),
                  TextResume(
                      title: "Drogue :",
                      subtitle: widget.dossier.checkDrogue! ? "Oui" : "Non"),
                  TextResume(
                      title: "Nom drogue :",
                      subtitle: widget.dossier.preciserDrogue),
                  Divider(),
                  TextResume(
                      title: "Autre habitudes :",
                      subtitle: widget.dossier.autreHabitude),
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
                  TextLongResume(
                      title: "Histoire :", subtitle: widget.dossier.histoire),
                  Divider(),
                  TextLongResume(
                      title: "Diagnostic Initial :",
                      subtitle: widget.dossier.diagnosticInit),
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
                    "Au Total",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  TextLongResume(
                      title: "Au total :", subtitle: widget.dossier.auTotal),
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
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepCancel: () =>
                currentStep == 0 ? null : setState(() => currentStep -= 1),
            onStepTapped: (step) => setState(() => currentStep = step),
            controlsBuilder: (context, detail) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EnvoyerDossierMail(
                                          dossier: widget.dossier),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  backgroundColor: kBlueColor,
                                ),
                                child: Text(
                                  "Envoyer dossier par Email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ))),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  await controller.generateDossierPDFController(
                                      widget.dossier);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  backgroundColor: kBlueColor,
                                ),
                                child: Text(
                                  "Gener Dossier sous format PDF",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ))),
                      ],
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

class TextResume extends StatelessWidget {
  const TextResume({
    this.title,
    this.subtitle,
    super.key,
  });
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 5),
          Text(
            subtitle!,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class TextLongResume extends StatelessWidget {
  const TextLongResume({
    this.title,
    this.subtitle,
    super.key,
  });
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
              textAlign: TextAlign.start,
            ),
            Text(
              subtitle!,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
