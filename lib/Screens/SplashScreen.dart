import 'package:HackerNews/Backend%20API/HackerNews.dart';
import 'package:HackerNews/Screens/FeedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getTopStoriesAsync().then((newData) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FeedScreen(
                  initialData: newData,
                ))));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hacker News',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(''),
              SpinKitRotatingPlain(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
