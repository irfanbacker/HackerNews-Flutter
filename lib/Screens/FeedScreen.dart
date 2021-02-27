import 'package:HackerNews/Widgets/NewsCard.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key, this.initialData}) : super(key: key);

  final initialData;

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  var data = [];

  @override
  void initState() {
    super.initState();
    data = widget.initialData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HackerNews Feed'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return NewsCard(
              newsItem: data[index],
            );
          }),
    );
  }
}
