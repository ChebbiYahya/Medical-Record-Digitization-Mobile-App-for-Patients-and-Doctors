import 'package:flutter/material.dart';

import '../../theme/constants.dart';

class NavProfilPage extends StatefulWidget {
  const NavProfilPage({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                ClipOval(
                  child: Image.asset(
                    "assets/images/photo_doctor_image.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}
