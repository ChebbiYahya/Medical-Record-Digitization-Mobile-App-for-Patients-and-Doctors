import 'package:get/get.dart';
import 'package:medconnectdoctor/models/dossier_model.dart';
import 'package:medconnectdoctor/repository/dossier_repo.dart';

import 'auth_controller.dart';

class DossierController extends GetxController {
  static DossierController get instance => Get.find();
  final _dossierRepo = Get.put(DossierRepo());
  final controller = Get.put(AuthController());

  createDossierController(
      DossierModel dossier, String idPatient, String idDoctor) async {
    await _dossierRepo.createDossier(dossier);
    await controller.addPatientToListOfDoctorController(idDoctor, idPatient);
  }

  Future<List<DossierModel>> getTousDossierPatientController(String id) async {
    return await _dossierRepo.getTousDossierPatient(id);
  }

  Future<List<DossierModel>> getPatientOfDoctorController(String id) async {
    List patientList = (await controller.getListPatientOfDoctorController(id))!;
    print("list from controller= ${patientList}");
    return await _dossierRepo.getPatientOfDoctor(patientList);
  }

  generateDossierPDFController(DossierModel dossier) async {
    await _dossierRepo.generateDossierPDF(dossier);
  }

  sendmailController(DossierModel dossier, String mail) async {
    await _dossierRepo.generateDossierPDF(dossier);
    print("mail =${mail}");
    _dossierRepo.sendmail(dossier, mail);
  }
}
