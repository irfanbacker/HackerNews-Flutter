import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getTopStoriesIDAsync() async {
  try {
    var response = await http.get(
      'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty',
    );
    List<dynamic> json = jsonDecode(response.body);
    return json;
  } catch (error) {
    print(error);
    return [];
  }
}

Future<dynamic> getStoryByIDAsync(int id) async {
  try {
    var response = await http.get(
      'https://hacker-news.firebaseio.com/v0/item/' +
          id.toString() +
          '.json?print=pretty',
    );
    var json = jsonDecode(response.body);
    print(json);
    return json;
  } catch (error) {
    print(error);
    return null;
  }
}

Future<List<dynamic>> getTopStoriesAsync() async {
  var storyIds = await getTopStoriesIDAsync();
  var stories = [];
  var maxLen = storyIds.length < 30 ? storyIds.length : 30;
  for (int id in storyIds.sublist(0, maxLen)) {
    var item = await getStoryByIDAsync(id);
    print(item);
    if (item == null) {
    } else if (item['type'] == 'story') {
      stories.add(item);
    }
  }
  return stories;
}
