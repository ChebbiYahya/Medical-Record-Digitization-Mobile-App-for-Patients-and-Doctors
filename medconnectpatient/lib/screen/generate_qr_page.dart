import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/auth_controller.dart';
import '../models/user_model.dart';

class GenerateQrPage extends StatefulWidget {
  const GenerateQrPage({super.key});

  @override
  State<GenerateQrPage> createState() => _GenerateQrPageState();
}

class _GenerateQrPageState extends State<GenerateQrPage> {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
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
        body: FutureBuilder(
            future: controller.getUserDetailsController(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data as UserModel;
                final String? idPatient = user.id;
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Mon QR Code",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 30),
                      idPatient != null
                          ? QrImageView(
                              padding: EdgeInsets.all(40),
                              data: idPatient,
                              version: QrVersions.auto,
                            )
                          : Container(),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
