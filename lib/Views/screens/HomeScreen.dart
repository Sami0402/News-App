import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/NewsController.dart';
import 'package:news_app/Views/screens/NewsDetailScreen.dart';
import 'package:news_app/Views/widgets/NewsTile.dart';
import 'package:news_app/Views/widgets/TrendingCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Newscontroller newsController = Get.put(Newscontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TAAZA KHABAR',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Icon(Icons.trending_up_outlined),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => newsController.TrendingNewsLoading.value
                      ? CircularProgressIndicator()
                      : Row(
                          children: newsController.TrendingNewsList.map(
                            (e) => TrendingCard(
                              onTap: () => Get.to(
                                NewsdetailScreen(
                                  news: e,
                                ),
                              ),
                              imageUrl: e.urlToImage ??
                                  "https://media.istockphoto.com/id/1409309637/vector/breaking-news-label-banner-isolated-vector-design.jpg?s=612x612&w=0&k=20&c=JoQHezk8t4hw8xXR1_DtTeWELoUzroAevPHo0Lth2Ow=",
                              title: e.title.toString(),
                              tag: "Trending no 1",
                              author: e.author ?? "Unknown",
                              time: e.publishedAt.toString(),
                              news: e,
                            ),
                          ).toList(),
                        ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News For you',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () => newsController.NewsForYouLoading.value
                    ? CircularProgressIndicator()
                    : Column(
                        children: newsController.NewsForYou5.map(
                          (e) => NewsTile(
                            onTap: () => Get.to(
                              NewsdetailScreen(
                                news: e,
                              ),
                            ),
                            imageUrl: e.urlToImage ??
                                "https://img.freepik.com/free-vector/gradient-breaking-news-logo-design_23-2151157239.jpg",
                            title: e.title.toString(),
                            time: e.publishedAt.toString(),
                            author: e.author.toString(),
                            news: e,
                          ),
                        ).toList(),
                      ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Buisness News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () => newsController.BuisnessNewsLoading.value
                    ? CircularProgressIndicator()
                    : Column(
                        children: newsController.BuisnessNews5.map(
                          (e) => NewsTile(
                            onTap: () => Get.to(
                              NewsdetailScreen(
                                news: e,
                              ),
                            ),
                            imageUrl: e.urlToImage ??
                                "https://img.freepik.com/free-vector/gradient-breaking-news-logo-design_23-2151157239.jpg",
                            title: e.title.toString(),
                            time: e.publishedAt.toString(),
                            author: e.author.toString(),
                            news: e,
                          ),
                        ).toList(),
                      ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tesla News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () => newsController.TeslaNewsLoading.value
                    ? CircularProgressIndicator()
                    : Column(
                        children: newsController.TeslaNews5.map(
                          (e) => NewsTile(
                            onTap: () => Get.to(
                              NewsdetailScreen(
                                news: e,
                              ),
                            ),
                            imageUrl: e.urlToImage ??
                                "https://img.freepik.com/free-vector/gradient-breaking-news-logo-design_23-2151157239.jpg",
                            title: e.title.toString(),
                            time: e.publishedAt.toString(),
                            author: e.author.toString(),
                            news: e,
                          ),
                        ).toList(),
                      ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Apple News',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => newsController.AppleNewsLoading.value
                      ? CircularProgressIndicator()
                      : Row(
                          children: newsController.AppleNews5.map(
                            (e) => TrendingCard(
                              onTap: () => Get.to(
                                NewsdetailScreen(
                                  news: e,
                                ),
                              ),
                              imageUrl: e.urlToImage ??
                                  "https://media.istockphoto.com/id/1409309637/vector/breaking-news-label-banner-isolated-vector-design.jpg?s=612x612&w=0&k=20&c=JoQHezk8t4hw8xXR1_DtTeWELoUzroAevPHo0Lth2Ow=",
                              title: e.title.toString(),
                              tag: "Trending no 1",
                              author: e.author ?? "Unknown",
                              time: e.publishedAt.toString(),
                              news: e,
                            ),
                          ).toList(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
