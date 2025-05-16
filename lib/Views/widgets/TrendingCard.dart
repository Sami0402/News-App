import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsModel.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;
  final NewsModel? news;
  const TrendingCard(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.time,
      required this.title,
      required this.author,
      required this.onTap,
      this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(right: 10),
        height: 350,
        width: 280,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primaryContainer,
          color: Color(0xFFFFF2C5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 280,
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  time,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text("${news?.author![0]}"),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
