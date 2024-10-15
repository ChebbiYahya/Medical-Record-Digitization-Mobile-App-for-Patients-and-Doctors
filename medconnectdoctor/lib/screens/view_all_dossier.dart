import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/screens/ajout_patient_statique_page.dart';
import '../controllers/dossier_controller.dart';
import '../models/patient_model.dart';
import '../models/user_model.dart';
import '../theme/constants.dart';
import 'components/dossier_component.dart';

class ViewAllDossier extends StatefulWidget {
  const ViewAllDossier({super.key, required this.usr, required this.patient});
  final UserModel usr;
  final PatientModel patient;

  @override
  State<ViewAllDossier> createState() => _ViewAllDossierState();
}

class _ViewAllDossierState extends State<ViewAllDossier> {
  final controller = Get.put(DossierController());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AjoutPatientStatiquePage(
                  usr: widget.usr,
                  patient: widget.patient,
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: kWhiteColor,
          ),
          backgroundColor: kBlueColor,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Les Dossiers de votre Patient \n",
                      ),
                      TextSpan(
                        text: "${widget.patient.fullName}",
                        style: TextStyle(
                          color: kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller
                      .getTousDossierPatientController(widget.patient.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While data is being fetched, show a loading indicator
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If there's an error, display an error message
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // If data is available, display it
                      return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return DossierComponent(
                            dossier: snapshot.data![index],
                          );
                        },
                      );
                    } else {
                      // If there's no data and no error, display an empty container
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
