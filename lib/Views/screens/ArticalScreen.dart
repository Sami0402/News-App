import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/NewsController.dart';
import 'package:news_app/Views/screens/NewsDetailScreen.dart';
import 'package:news_app/Views/widgets/SearchWidget.dart';

import '../widgets/NewsTile.dart';

class ArticalScreen extends StatelessWidget {
  Newscontroller newscontroller = Get.put(Newscontroller());
  ArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: newscontroller.NewsForYou.map(
                    (e) => NewsTile(
                      onTap: () {
                        Get.to(NewsdetailScreen(news: e));
                      },
                      imageUrl: e.urlToImage ??
                          "https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/01/16/317_1705413514.jpg",
                      title: e.title!,
                      author: e.author ?? "Unknown",
                      time: e.publishedAt!,
                      news: e,
                    ),
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
