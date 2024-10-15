import 'package:flutter/material.dart';
import 'package:medconnectpatient/screen/generate_qr_page.dart';

import '../../models/user_model.dart';
import '../../theme/constants.dart';

class NavProfilPage extends StatefulWidget {
  const NavProfilPage({super.key, required this.user});
  final UserModel user;

  @override
  State<NavProfilPage> createState() => _NavProfilPageState();
}

class _NavProfilPageState extends State<NavProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bienvenue",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Donna Troy",
                        style: Theme.of(context).textTheme.headline5!,
                        //.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/profile_image.png",
                  // height: 40,
                ),
              ],
            ),
            Spacer(),
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenerateQrPage(),
                    ),
                  );
                },
                child: Text(
                  "Generer  un QR de votre dossier",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () async {
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );*/
                },
                child: Text(
                  "Generer un doc PDF et envoyer par mail",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () async {
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );*/
                },
                child: Text(
                  "Parametres et confidentialité",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () async {
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );*/
                },
                child: Text(
                  "Déconnecter",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
