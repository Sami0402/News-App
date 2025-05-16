import 'package:get/get.dart';
import 'package:news_app/Views/screens/ArticalScreen.dart';
import 'package:news_app/Views/screens/ProfileScreen.dart';

import '../Views/screens/HomeScreen.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomeScreen(),
    ArticalScreen(),
    ProfileScreen(),
  ];
}
