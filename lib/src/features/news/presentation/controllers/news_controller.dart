import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_news_app/src/features/news/data/repo/news_repo.dart';
import 'package:riverpod_news_app/src/features/news/domain/newsmodel.dart';

final newsRepoProvider = Provider((ref) => NewsRepo());
final selectedNews = StateProvider(
  (ref) => NewsModel(
      pubDate: "2023-02-06T08:00:16Z",
      sectionName: 'Football',
      title:
          "Promotion and relegation changes up for debate as Premier League and EFL talk | Jason Stockwood",
      type: 'article',
      webUrl:
          "https://www.theguardian.com/football/blog/2023/feb/06/promotion-and-relegation-changes-up-for-debate-as-premier-league-and-efl-talk"),
);
final asyncNewsProvider =
    AsyncNotifierProvider<AsyncNewsNotifier, List<NewsModel>>(
        () => AsyncNewsNotifier());

class AsyncNewsNotifier extends AsyncNotifier<List<NewsModel>> {
  @override
  FutureOr<List<NewsModel>> build() {
    return getNews();
  }

  Future<List<NewsModel>> getNews() async {
    state = const AsyncLoading();
    List<NewsModel> list = [];
    state = await AsyncValue.guard(() async {
      list = await ref.read(newsRepoProvider).getNews();
      return list;
    });
    return list;
  }
}
