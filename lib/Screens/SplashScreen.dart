import 'package:HackerNews/Screens/FeedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mockData = [
      {'title': '1', 'descendants': '10', 'by': 'test1'},
      {'title': '2', 'descendants': '22', 'by': 'test2'},
      {'title': '3', 'descendants': '99', 'by': 'test3'}
    ];
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FeedScreen(
                      initialData: mockData,
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
