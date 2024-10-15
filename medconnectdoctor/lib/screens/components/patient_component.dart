import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/models/dossier_model.dart';
import 'package:medconnectdoctor/models/patient_model.dart';
import 'package:medconnectdoctor/models/user_model.dart';
import 'package:medconnectdoctor/screens/dossier_patient_page.dart';
import 'package:medconnectdoctor/screens/view_all_dossier.dart';

import '../../theme/constants.dart';

class patientComponent extends StatelessWidget {
  const patientComponent({super.key, required this.dossier, required this.usr});
  final DossierModel dossier;
  final UserModel usr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final PatientModel patient = PatientModel(
            fullName: "${dossier.nom} ${dossier.prenom}",
            id: dossier.idPatient);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewAllDossier(usr: usr, patient: patient),
          ),
        );
      },
      child: Container(
        height: 170,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kLightBlueColor,
          //color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(4.0, 4.0),
                blurRadius: 15,
                spreadRadius: 1),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15,
                spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/photo_patient_image.jpg",
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${dossier.nom} ${dossier.prenom}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Age: ${dossier.age}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kDarkGreeyColor),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Sexe: ${dossier.sexe}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kDarkGreeyColor),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "CIN: ${dossier.cin}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kDarkGreeyColor),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Professin: ${dossier.profession}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kDarkGreeyColor),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Couvert.Soc: ${dossier.couverture}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kDarkGreeyColor),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: kGreeyColor,
                        //color: kWhiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.local_phone_outlined,
                            color: kBlueColor,
                            size: 12,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${dossier.telephone}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: kBlueColor),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: kDarkGreeyColor,
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${dossier.adresse}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: kDarkGreeyColor),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
