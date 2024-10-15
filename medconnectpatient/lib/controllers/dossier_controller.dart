import 'package:get/get.dart';

import '../models/dossier_model.dart';
import '../repository/dossier_repo.dart';

class DossierController extends GetxController {
  static DossierController get instance => Get.find();
  final _dossierRepo = Get.put(DossierRepo());

  createDossierController(DossierModel dossier) async {
    await _dossierRepo.createDossier(dossier);
  }

  Future<List<DossierModel>> getTousDossierController() async {
    return await _dossierRepo.getTousDossier();
  }

  Future<List<DossierModel>> getTousDossierPatientController(String id) async {
    return await _dossierRepo.getTousDossierPatient(id);
  }

  generateDossierPDFController(DossierModel dossier) async {
    await _dossierRepo.generateDossierPDF(dossier);
  }

  sendmailController(DossierModel dossier, String mail) async {
    await _dossierRepo.generateDossierPDF(dossier);
    _dossierRepo.sendmail(dossier, mail);
  }
}
