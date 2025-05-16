import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/HomeScreenController.dart';
import 'package:news_app/Views/screens/HomeScreen.dart';
import 'package:news_app/Views/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: darkTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: Homescreencontroller(),
    );
  }
}
