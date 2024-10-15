import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dossier_controller.dart';
import '../models/dossier_model.dart';
import '../theme/constants.dart';

class EnvoyerDossierMail extends StatelessWidget {
  const EnvoyerDossierMail({super.key, required this.dossier});
  final DossierModel dossier;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = new TextEditingController();
    final controller = Get.put(DossierController());

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
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Envoyer Dossier Par Email",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Votre Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
              SizedBox(height: 10),
              Spacer(),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () async {
                      await controller.sendmailController(
                          dossier, _emailController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: kBlueColor,
                    ),
                    child: Text(
                      "Envoyer",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
