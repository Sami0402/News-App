import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/BottomNavController.dart';

import '../Views/components/NavigationBar.dart';

class Homescreencontroller extends StatelessWidget {
  const Homescreencontroller({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: MyBottomNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
