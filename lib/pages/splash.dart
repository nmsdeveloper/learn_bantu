import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_bantu/pages/start.dart';
import 'package:learn_bantu/variables/style.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const StartPage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        width: _width,
        height: _height,
        decoration: bgGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bantu",
              style: textUbuntu(
                color: const Color(0xffffffff),
                weight: FontWeight.bold,
                size: _height / 10,
              ),
            ),
            SizedBox(
              height: _height / 40,
            ),
            SpinKitPulse(
              color: const Color(0xff111111),
              size: _height / 20,
              duration: const Duration(seconds: 2),
            ),
          ],
        ),
      ),
    );
  }
}
