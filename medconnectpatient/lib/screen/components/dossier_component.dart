import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/dossier_model.dart';
import '../../theme/constants.dart';
import '../dossier_patient_page.dart';

class DossierComponent extends StatelessWidget {
  const DossierComponent({
    super.key,
    required this.dossier,
  });
  final DossierModel dossier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DossierPatientPage(dossier: dossier),
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/images/doc_image.png")),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6!,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Medecin: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlueColor,
                      ),
                    ),
                    TextSpan(
                      text: dossier.nomDoctor,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6!,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Specialité: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlueColor,
                      ),
                    ),
                    TextSpan(
                      text: dossier.specDoctor,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
