import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/NewsModel.dart';

class Newscontroller extends GetxController {
  RxList<NewsModel> TrendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> NewsForYou = <NewsModel>[].obs;
  RxList<NewsModel> NewsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> AppleNews = <NewsModel>[].obs;
  RxList<NewsModel> AppleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> TeslaNews = <NewsModel>[].obs;
  RxList<NewsModel> TeslaNews5 = <NewsModel>[].obs;
  RxList<NewsModel> BuisnessNews = <NewsModel>[].obs;
  RxList<NewsModel> BuisnessNews5 = <NewsModel>[].obs;

  RxBool TrendingNewsLoading = false.obs;
  RxBool NewsForYouLoading = false.obs;
  RxBool AppleNewsLoading = false.obs;
  RxBool TeslaNewsLoading = false.obs;
  RxBool BuisnessNewsLoading = false.obs;

  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrendingNews();
    getAppleNews();
    getBuisnessNews();
    getTeslaNews();
  }

  Future<void> getTrendingNews() async {
    TrendingNewsLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f87b7b74277e43158d66ee866b0fde35";

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          TrendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something went wriing in Trending News");
      }
    } catch (e) {
      print(e);
    }
    TrendingNewsLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    NewsForYouLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f87b7b74277e43158d66ee866b0fde35";

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          NewsForYou.add(NewsModel.fromJson(news));
        }
        NewsForYou5.value = NewsForYou.sublist(0, 5).obs;
      } else {
        print("Something went wriing in Trending News");
      }
    } catch (e) {
      print(e);
    }
    NewsForYouLoading.value = false;
  }

  Future<void> getAppleNews() async {
    AppleNewsLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=apple&from=2025-04-17&to=2025-04-17&sortBy=popularity&apiKey=f87b7b74277e43158d66ee866b0fde35";

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          AppleNews.add(NewsModel.fromJson(news));
        }
        AppleNews5.value = AppleNews.sublist(0, 5).obs;
      } else {
        print("Something went wriing in Trending News");
      }
    } catch (e) {
      print(e);
    }
    AppleNewsLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    TeslaNewsLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-04-14&sortBy=publishedAt&apiKey=f87b7b74277e43158d66ee866b0fde35";

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          TeslaNews.add(NewsModel.fromJson(news));
        }
        TeslaNews5.value = TeslaNews.sublist(0, 5).obs;
      } else {
        print("Something went wriing in Trending News");
      }
    } catch (e) {
      print(e);
    }
    TeslaNewsLoading.value = false;
  }

  Future<void> getBuisnessNews() async {
    BuisnessNewsLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f87b7b74277e43158d66ee866b0fde35";

    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          BuisnessNews.add(NewsModel.fromJson(news));
        }
        BuisnessNews5.value = BuisnessNews.sublist(0, 5).obs;
      } else {
        print("Something went wriing in Trending News");
      }
    } catch (e) {
      print(e);
    }
    BuisnessNewsLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    NewsForYouLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=$search&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        NewsForYou.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          NewsForYou.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    NewsForYouLoading.value = false;
  }
}
