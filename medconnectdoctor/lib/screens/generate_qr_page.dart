import 'package:flutter/material.dart';

class GenererQrPage extends StatefulWidget {
  const GenererQrPage({super.key});

  @override
  State<GenererQrPage> createState() => _GenererQrPageState();
}

class _GenererQrPageState extends State<GenererQrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Image.asset(
            "assets/images/appbar_image.png",
            height: 40,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
