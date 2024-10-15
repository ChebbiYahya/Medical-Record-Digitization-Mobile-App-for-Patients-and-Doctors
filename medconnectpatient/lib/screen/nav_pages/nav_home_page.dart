import 'package:flutter/material.dart';
import 'package:medconnectpatient/screen/services_pages/Pharmacies_pages.dart';
import 'package:medconnectpatient/screen/services_pages/ambulances_pages.dart';
import 'package:medconnectpatient/screen/services_pages/hopitaux_pages.dart';
import 'package:medconnectpatient/screen/services_pages/medecin_page.dart';

import '../../theme/constants.dart';
import '../components/article_component.dart';

class NavHomePage extends StatefulWidget {
  const NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/home_image.png",
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nos services",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HopitauxPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kBlueContaineColor,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/hopital_image.png",
                              ),
                              SizedBox(height: 7),
                              Text(
                                "Hopitaux",
                                style: Theme.of(context).textTheme.headline6!,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedecinsPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kRedContaineColor,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/medecin_image.png",
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Médecins",
                                style: Theme.of(context).textTheme.headline6!,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AmbulancePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kGreenContaineColor,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/ambulance_image.png",
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Ambulances",
                                style: Theme.of(context).textTheme.headline6!,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PharmaciePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kYellowContaineColor,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/pharmacie_image.png",
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Pharmacie",
                                style: Theme.of(context).textTheme.headline6!,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Articles populaires",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 240,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ArticleComponent();
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
