import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/models/dossier_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DossierRepo extends GetxController {
  static DossierRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
// Create Dossier

  createDossier(DossierModel dossier) async {
    final docDossier = _db.collection("Dossier").doc();
    dossier = dossier.setId(docDossier.id);
    await docDossier.set(dossier.toJson());
  }

  Future<List<DossierModel>> getTousDossierPatient(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("Dossier")
          .where("idPatient", isEqualTo: id)
          .get();
      List<DossierModel> dossiers = [];
      snapshot.docs.forEach((doc) {
        DossierModel dossier = DossierModel.fromSnapshot(doc);
        dossiers.add(dossier);
        print(dossier.adresse.toString());
      });
      print(dossiers);
      return dossiers;
    } catch (e) {
      print("Erreur lors de la récupération des dossiers: $e");
      return [];
    }
  }

  Future<List<DossierModel>> getPatientOfDoctor(List patientList) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("Dossier")
          .where("idPatient", whereIn: patientList)
          .get();

      Set<String> patientIdsAdded =
          Set(); // Ensemble pour garder une trace des identifiants des patients déjà ajoutés
      List<DossierModel> dossiers = [];
      snapshot.docs.forEach((doc) {
        DossierModel dossier = DossierModel.fromSnapshot(doc);
        if (!patientIdsAdded.contains(dossier.idPatient)) {
          // Vérifier si l'identifiant du patient n'est pas déjà ajouté
          dossiers.add(dossier);
          patientIdsAdded.add(dossier
              .idPatient!); // Ajouter l'identifiant du patient à l'ensemble
        }
      });
      print(dossiers);
      return dossiers;
    } catch (e) {
      print("Erreur lors de la récupération des dossiers: $e");
      return [];
    }
  }

  //gener PDF dossier
  generateDossierPDF(DossierModel dossier) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          pageFormat: pw.PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Container(
                padding: pw.EdgeInsets.all(30),
                child: pw.Column(
                  children: [
                    pw.Text(
                      "Dossier Medicale",
                      style: pw.TextStyle(
                        fontSize: 30,
                        color: pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "${dossier.nom} ${dossier.prenom}",
                      style: pw.TextStyle(
                        color: pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Médecin : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        //pw.Spacer(),
                        pw.Text(
                          "${dossier.nomDoctor} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.Spacer(),
                        pw.Text(
                          "Spécialité : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${dossier.specDoctor} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Introduction",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),

                    pw.Row(
                      children: [
                        pw.Text(
                          "Nom : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        //pw.Spacer(),
                        pw.Text(
                          "${dossier.nom} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Prenom : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${dossier.prenom} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Age : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${dossier.age} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Sexe : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${dossier.sexe} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    // pw.SizedBox(height: 10),
                    pw.Divider(),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Adresse : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.adresse} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Telephone : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.telephone} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Gouvernerat : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.gouvernerat} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),
                    //pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Couveture social : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.couverture} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "CIN : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        //pw.Spacer(),
                        pw.Text(
                          "${dossier.cin} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Profession : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${dossier.profession} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),

                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Antécédents Familiaux",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),

                    if (dossier.checkPasAntecFam == true)
                      pw.Text(
                        "Pas d'antécéndent familiaux",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    if (dossier.checkPasAntecFam == false)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Nb des antecedents familiaux : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.antecFamil} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (dossier.checkPasAntecFam == false)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Les antécédents familiaux : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.preciserAntecFamil} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (dossier.checkAntecPerCanc == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Antécedents personnels de cancer : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.checkAntecPerCanc! ? "Oui" : "Non"} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (dossier.checkAntecPerCanc == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Les antécédents personnels de cancer : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.preciserAntecFamil} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Antécédents médicaux",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    if (dossier.checkPasAntecMed == true)
                      pw.Text(
                        "Pas d'antécéndents medicaux",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Diabéte : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkDiabete! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    if (dossier.checkDiabete == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Ancienneté diabéte (Ans) : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.ancienDiabete} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (dossier.checkDiabete == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Complications diabéte : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.complDiabete} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.Divider(),

                    pw.Row(
                      children: [
                        pw.Text(
                          "HTA : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkHTA! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    if (dossier.checkHTA == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Ancienneté HTA : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.ancienHTA} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.Divider(),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Coronaropathie : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkCoronorpathie! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),
                    pw.Text(
                      "Insuffisances",
                      style: pw.TextStyle(
                        color: pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Cardiaque : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkCardiaque! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Rénale : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkRenal! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Hépatique : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkHepatique! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Resp.Chr : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkRespChr! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),

                    pw.Row(
                      children: [
                        pw.Text(
                          "Allergie : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkAlergie! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    if (dossier.checkAlergie == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Les Allergies : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.preciserAllergie} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (dossier.checkAlergie == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Traitement Habituel : ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${dossier.traitHabAllerie} ",
                            style: pw.TextStyle(
                              color: pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Antécédents Chirurgicaux",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    if (dossier.checkPasAntecChir == true)
                      pw.Text(
                        "Pas d'antécéndents Chirurgicaux ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Opéré(e) : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.checkOpere! ? "Oui" : "Non"} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Les opérations : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.preciserOpere} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              padding: pw.EdgeInsets.all(30),
              child: pw.Column(
                children: [
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Antécéndents gynéco-obstetricaux",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  if (dossier.checkPasAntecChir == true)
                    pw.Text(
                      "Pas d'antécéndents gynéco-obstetricaux",
                      style: pw.TextStyle(
                        color: pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Menarche : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.menarche} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Age 1er rapport : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.nbIVG} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Allaitement(nb/M) : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.allaitement} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nb de grossesses : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.nbGrossesse} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nb Parité : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.nbParite} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nb Enfants Vivants : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.nbEnfant} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nb Fausses couches : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.nbFaussCouche} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Enceinte : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.checkenceinte! ? "Oui" : "Non"} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Le terme : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.preciserEnceinte} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Contraception : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.contraception} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Hormonale(Nb/M) : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.hormonale} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Activités Ginétales : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.activiteGinet} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Menopause depuis (Age) ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.menopause} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Habitudes",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  if (dossier.checkPasHabitude == true)
                    pw.Text(
                      "Pas d'habitudes : ",
                      style: pw.TextStyle(
                        color: pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Alcool : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.checkAlcool! ? "Oui" : "Non"} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Tabac : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.checkTabac! ? "Oui" : "Non"} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Paquet/an : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.paquetAn} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Chicha : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.checkChicha! ? "Oui" : "Non"} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Chicha/an : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.chichaAn} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Drogue : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.checkDrogue! ? "Oui" : "Non"} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nom drogue : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.preciserDrogue} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Autre habitudes : ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${dossier.autreHabitude} ",
                        style: pw.TextStyle(
                          color: pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Histoire de la maladie",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Histoire : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.histoire} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.Text(
                          "Diagnostic Initial : ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${dossier.diagnosticInit} ",
                          style: pw.TextStyle(
                            color: pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Au Total",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Column(
                        children: [
                          pw.Text("${dossier.auTotal} ",
                              style: pw.TextStyle(
                                color: pw.PdfColor.fromInt(0xFF094067),
                                fontSize: 15,
                                fontWeight: pw.FontWeight.normal,
                              ),
                              textAlign: pw.TextAlign.start),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    File("$path/dossier.pdf").writeAsBytes(await pdf.save());
    OpenFile.open("$path/dossier.pdf");
    Printing.layoutPdf(onLayout: (pw.PdfPageFormat format) async => pdf.save());
  }

  Future<void> sendmail(DossierModel dossier, String mail) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    var attachement = File("$path/dossier.pdf").path;
    final Email email = Email(
      subject: 'Dossier médical de ${dossier.nom} ${dossier.prenom}',
      body:
          "Cher(e) Dr \n J'espère que vous allez bien.\n Je vous envoie également une copie du dossier de notre patient(e) ${dossier.nom} ${dossier.prenom} mis à jour au format PDF en pièce jointe de ce courriel, pour votre référence et vos archives. \n Je tiens à vous informer que le dossier médical de notre patient(e) a été mis à jour avec succès via notre application médicale. \n Cordialement, \n Nom Docteur : ${dossier.nomDoctor} \n Specialité : ${dossier.specDoctor} ",
      recipients: [
        mail.toString(),
      ],
      attachmentPaths: [attachement],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
