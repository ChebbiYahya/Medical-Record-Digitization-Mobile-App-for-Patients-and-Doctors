import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/screens/view_all_dossier.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import '../../controllers/patient_controller.dart';
import '../../models/patient_model.dart';
import '../../models/user_model.dart';

class NavAddDossierPage extends StatefulWidget {
  const NavAddDossierPage({super.key, required this.usr});
  final UserModel usr;

  @override
  State<NavAddDossierPage> createState() => _NavAddDossierPageState();
}

class _NavAddDossierPageState extends State<NavAddDossierPage> {
  List<Barcode> barcodes = [];
  final controller = Get.put(PatientController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Scan QR d'un nv patient",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates,
                      returnImage: true,
                    ),
                    onDetect: (capture) async {
                      setState(() {
                        barcodes = capture.barcodes;
                      });
                      final Uint8List? image = capture.image;
                      for (final barcode in barcodes) {
                        print("BarCode found ! ${barcode.rawValue}");
                      }
                      if (image != null) {
                        PatientModel patient =
                            await controller.getPatientDetailsController(
                                barcodes.first.rawValue ?? "");
                        print(
                            "patient data name =${patient.fullName} id= ${patient.id}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllDossier(
                              usr: widget.usr,
                              patient: patient,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.transparent,
                    scanAreaWidth: 300,
                    scanAreaHeight: 300,
                  )
                ],
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
