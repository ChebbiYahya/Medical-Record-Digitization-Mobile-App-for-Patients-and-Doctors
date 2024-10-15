import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/patient_model.dart';

class PatientRepo extends GetxController {
  static PatientRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  //Get Patient Info(nom, prenom, cin)
  Future<PatientModel> getPatientDetails(String id) async {
    final snapshot =
        await _db.collection("usersPatient").where("id", isEqualTo: id).get();
    final patientData =
        snapshot.docs.map((e) => PatientModel.fromSnapshot(e)).single;

    return patientData;
  }
}
