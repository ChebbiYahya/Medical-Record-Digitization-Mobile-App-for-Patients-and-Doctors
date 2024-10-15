import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'firebase_options.dart';
import 'screen/acceuil_page.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedConnect Patient',
      theme: TAppTheme.mobileTheme,
      home: AnimatedSplashScreen(
        splash: SvgPicture.asset("assets/images/splash_image.svg"),
        splashIconSize: 400,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: AcceuilPage(),
      ),
    );
  }
}
