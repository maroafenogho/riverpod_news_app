import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_news_app/src/features/news/domain/newsmodel.dart';
import 'package:riverpod_news_app/src/utils/app_utils.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    List<NewsModel> list = [];
    const url =
        'https://content.guardianapis.com/search?page=2&q=debate&api-key=${AppUtils.newsKey}';

    final response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      for (final news in jsonResponse['response']['results']) {
        list.add(NewsModel.fromJson(news));
      }
    } else {
      throw 'Could not fetch news';
    }
    return list;
  }
}
