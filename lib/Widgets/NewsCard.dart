import 'package:HackerNews/Screens/WebViewScreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  NewsCard({Key? key, this.newsItem}) : super(key: key);

  final newsItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      child: ListTile(
        key: key,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
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
                  newsItem['descendants'].toString() + ' Comments',
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
        onTap: () {
          if (kIsWeb)
            launch(newsItem['url'] as String);
          else if (Platform.isAndroid || Platform.isIOS)
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                          url: newsItem['url'],
                        )));
          else
            launch(newsItem['url'] as String);
        },
      ),
      color: Colors.grey[350],
    );
  }
}
