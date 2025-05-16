import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';

class NewsdetailScreen extends StatelessWidget {
  final NewsModel news;
  const NewsdetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Text("Back"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 250,
                  width: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      news.urlToImage ??
                          "https://t4.ftcdn.net/jpg/02/67/50/13/360_F_267501302_g9bxhlMorjsVv4iwOVdjdPIiKCbDt9yQ.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  news.title.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "${news.author} * ${news.publishedAt}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text("${news.author?[0]}"),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "${news.author}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "${news.description}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
