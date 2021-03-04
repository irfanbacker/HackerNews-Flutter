import 'package:HackerNews/Backend%20API/HackerNews.dart';
import 'package:HackerNews/Widgets/NewsCard.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key, this.initialData}) : super(key: key);

  final List<dynamic>? initialData;

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    data = widget.initialData!;
  }

  Future<void> updateFeed() async {
    var newData = await getTopStoriesAsync();
    setState(() {
      data = newData!;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HackerNews Feed'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: updateFeed,
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(
                key: Key(data[index]['id'].toString()),
                newsItem: data[index],
              );
            }),
      ),
    );
  }
}
