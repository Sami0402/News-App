import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsModel.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  void Function()? onTap;
  final NewsModel? news;

  NewsTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.author,
    required this.onTap,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primaryContainer,
          color: Color(0xFFE0F1FF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text("${news?.author?[0]}"),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    time,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
