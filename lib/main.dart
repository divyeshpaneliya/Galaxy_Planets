import 'package:flutter/material.dart';
import 'package:galaxy_planets/utils/getx_routs.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      getPages: Getp,
    )
  );
}

