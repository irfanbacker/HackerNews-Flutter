import 'package:HackerNews/Screens/WebViewScreen.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  NewsCard({Key key, this.newsItem}) : super(key: key);

  final newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          newsItem['title'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        subtitle: Column(
          children: [
            Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  newsItem['descendants'] + ' Comments',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  newsItem['by'],
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(
                      url: newsItem['url'],
                    ))),
      ),
      color: Colors.grey[350],
    );
  }
}
