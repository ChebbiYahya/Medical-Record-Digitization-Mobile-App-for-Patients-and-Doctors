import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dossier_controller.dart';
import '../../models/user_model.dart';
import '../components/patient_component.dart';

class NavViewDossierPage extends StatefulWidget {
  const NavViewDossierPage({super.key, required this.usr});
  final UserModel usr;

  @override
  State<NavViewDossierPage> createState() => _NavViewDossierPageState();
}

class _NavViewDossierPageState extends State<NavViewDossierPage> {
  final controller = Get.put(DossierController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Les Dossier de vos Patients",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                  future:
                      controller.getPatientOfDoctorController(widget.usr.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return patientComponent(
                                dossier: snapshot.data![index],
                                usr: widget.usr,
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return Center(
                            child: Text("Quelque chose n'a pas fonctionné"));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
