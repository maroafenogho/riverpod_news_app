import 'package:riverpod_news_app/src/features/news/data/services/news_service.dart';
import 'package:riverpod_news_app/src/features/news/domain/newsmodel.dart';

class NewsRepo {
  NewsRepo({NewsService? service}) : _newsService = service ?? NewsService();
  final NewsService _newsService;

  Future<List<NewsModel>> getNews() async {
    return await _newsService.getNews();
  }
}
