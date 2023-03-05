import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_news_app/src/features/news/presentation/controllers/news_controller.dart';
import 'package:riverpod_news_app/src/features/news/presentation/screens/widgets/news_card.dart';
import 'package:riverpod_news_app/src/utils/extensions.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final newsList = ref.watch(asyncNewsProvider);

          return newsList.when(data: (news) {
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  date: news[index].pubDate.getDate,
                  section: news[index].sectionName,
                  title: news[index].title,
                  onTap: () {
                    ref.read(selectedNews.notifier).state = news[index];
                    debugPrint(ref.watch(selectedNews).title);
                  },
                );
              },
            );
          }, error: (error, stackTrace) {
            return Column(
              children: [Text(stackTrace.toString())],
            );
          }, loading: () {
            return const CircularProgressIndicator();
          });
        },
      ),
    );
  }
}
