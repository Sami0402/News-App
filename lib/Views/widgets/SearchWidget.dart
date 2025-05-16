import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/Controllers/NewsController.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    TextEditingController searchController = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search news...",
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              newscontroller.searchNews(searchController.text);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}
