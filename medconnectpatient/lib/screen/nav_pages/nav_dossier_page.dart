import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dossier_controller.dart';
import '../../models/user_model.dart';
import '../../theme/constants.dart';
import '../components/dossier_component.dart';

class NavDossierPage extends StatefulWidget {
  const NavDossierPage({super.key, required this.user});
  final UserModel user;

  @override
  State<NavDossierPage> createState() => _NavDossierPageState();
}

class _NavDossierPageState extends State<NavDossierPage> {
  final controller = Get.put(DossierController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      text: "Vos Dossiers ",
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
                future:
                    controller.getTousDossierPatientController(widget.user.id!),
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
    );
  }
}
