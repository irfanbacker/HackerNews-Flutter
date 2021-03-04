import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<int>?> getTopStoriesIDAsync() async {
  try {
    var response = await http.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty'),
    );
    List<dynamic>? json = jsonDecode(response.body);
    return json?.cast<int>();
  } catch (error) {
    print(error);
    return [];
  }
}

Future<Map<String, dynamic>?> getStoryByIDAsync(int id) async {
  try {
    var response = await http.get(
      Uri.parse('https://hacker-news.firebaseio.com/v0/item/' +
          id.toString() +
          '.json?print=pretty'),
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    return json;
  } catch (error) {
    print(error);
    return null;
  }
}

Future<List<Map<String, dynamic>>> getTopStoriesAsync() async {
  List<int> storyIds = (await getTopStoriesIDAsync()) ?? [];
  List<Map<String, dynamic>> stories = [];
  var maxLen = storyIds.length < 30 ? storyIds.length : 30;
  for (int id in storyIds.sublist(0, maxLen)) {
    Map<String, dynamic>? item = await getStoryByIDAsync(id);
    if (item == null) {
    } else if (item['type'] == 'story') {
      stories.add(item);
    }
  }
  return stories;
}
