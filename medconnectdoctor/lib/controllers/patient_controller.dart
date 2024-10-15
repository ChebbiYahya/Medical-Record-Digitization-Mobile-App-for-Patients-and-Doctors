import 'package:get/get.dart';
import '../repository/patient_repo.dart';

class PatientController extends GetxController {
  static PatientController get instance => Get.find();
  final _PatientRepo = Get.put(PatientRepo());

  getPatientDetailsController(String id) async {
    if (id != "") {
      return _PatientRepo.getPatientDetails(id);
    } else
      return null;
  }
}
