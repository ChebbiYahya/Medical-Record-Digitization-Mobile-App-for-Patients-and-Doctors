import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medconnectpatient/screen/nav_pages/nav_dossier_page.dart';
import 'package:medconnectpatient/screen/nav_pages/nav_profil_page.dart';
import '../models/user_model.dart';
import '../theme/constants.dart';
import 'nav_pages/nav_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final UserModel user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      NavHomePage(),
      NavDossierPage(
        user: widget.user,
      ),
      NavProfilPage(
        user: widget.user,
      ),
    ];
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            gap: 10,
            padding: EdgeInsets.all(12),
            color: kDarkBlueColor,
            activeColor: kBlueColor,
            duration: Duration(milliseconds: 600),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.insert_drive_file_outlined,
                text: "Dossier",
              ),
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.person_outline_rounded,
                text: "Profil",
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
