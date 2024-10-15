import 'package:flutter/material.dart';
import 'package:medconnectpatient/screen/sign_in_page.dart';

import '../theme/constants.dart';

class AcceuilPage extends StatelessWidget {
  const AcceuilPage({super.key});

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
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Prenez soin de\n votre santé !",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 12,
              child: Image.asset(
                "assets/images/acceuil_image.png",
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueColor,
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Commencer",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
