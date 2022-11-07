import 'package:galaxy_planets/screens/home_screen/view/home.dart';
import 'package:galaxy_planets/screens/s_screen/Splash_S.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> Getp = [
  GetPage(
    name: '/',
    page: ()=>Splash(),
  ),
  GetPage(
    name: '/home',
    page: ()=>Home(),
  )
];
