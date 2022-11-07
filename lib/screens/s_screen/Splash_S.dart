import 'dart:async';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/utils/colors.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed('/home');
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pri,
        body: Container(child: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
