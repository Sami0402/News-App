import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/BottomNavController.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 60,
            width: 140,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.home,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.secondaryContainer,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.book,
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.secondaryContainer,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     controller.index.value = 2;
                //   },
                //   child: Obx(
                //     () => AnimatedContainer(
                //       duration: Duration(milliseconds: 300),
                //       curve: Curves.bounceInOut,
                //       width: 40,
                //       height: 40,
                //       padding: EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //         color: controller.index.value == 2
                //             ? Theme.of(context).colorScheme.primary
                //             : null,
                //         borderRadius: BorderRadius.circular(100),
                //       ),
                //       child: Icon(
                //         Icons.settings,
                //         color: controller.index.value == 2
                //             ? Theme.of(context).colorScheme.onSurface
                //             : Theme.of(context).colorScheme.secondaryContainer,
                //         size: 25,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
