class NewsModel {
  String type;
  String sectionName;
  String pubDate;
  String title;
  String webUrl;

  NewsModel({
    required this.pubDate,
    required this.sectionName,
    required this.title,
    required this.type,
    required this.webUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> news) {
    return NewsModel(
        pubDate: news['webPublicationDate'],
        sectionName: news['sectionName'],
        title: news['webTitle'],
        type: news['type'],
        webUrl: news['webUrl']);
  }
}

// {
// "id": "football/blog/2023/feb/06/promotion-and-relegation-changes-up-for-debate-as-premier-league-and-efl-talk",
// "type": "article",
// "sectionId": "football",
// "sectionName": "Football",
// "webPublicationDate": "2023-02-06T08:00:16Z",
// "webTitle": "Promotion and relegation changes up for debate as Premier League and EFL talk | Jason Stockwood",
// "webUrl": "https://www.theguardian.com/football/blog/2023/feb/06/promotion-and-relegation-changes-up-for-debate-as-premier-league-and-efl-talk",
// "apiUrl": "https://content.guardianapis.com/football/blog/2023/feb/06/promotion-and-relegation-changes-up-for-debate-as-premier-league-and-efl-talk",
// "isHosted": false,
// "pillarId": "pillar/sport",
// "pillarName": "Sport"
// },