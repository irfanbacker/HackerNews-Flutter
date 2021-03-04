import 'package:HackerNews/Backend%20API/HackerNews.dart';
import 'package:HackerNews/Widgets/NewsCard.dart';
import 'package:flutter/material.dart';
import 'package:HackerNews/constants.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key, required this.initialData}) : super(key: key);

  final List<Map<String, dynamic>> initialData;

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Map<String, dynamic>> data = [];
  bool isRefreshing = false;

  @override
  void initState() {
    super.initState();
    data = widget.initialData;
  }

  Future<void> updateFeed() async {
    setState(() {
      isRefreshing = true;
    });
    List<Map<String, dynamic>> newData = await getTopStoriesAsync();
    setState(() {
      isRefreshing = false;
      data = newData;
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
        actions: [
          if (PlatformDevice.isWeb || PlatformDevice.isDesktop)
            if (isRefreshing)
              Container(
                child: CircularProgressIndicator(),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
              )
            else
              IconButton(
                  icon: Icon(
                    Icons.refresh,
                    size: 30.0,
                  ),
                  onPressed: updateFeed)
        ],
      ),
      body: PlatformDevice.isWeb || PlatformDevice.isDesktop
          ? Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                      key: Key(data[index]['id'].toString()),
                      newsItem: data[index],
                    );
                  }),
            )
          : RefreshIndicator(
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
