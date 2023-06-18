import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static List<WebtoonModel> webtoonInstances = [];
  static final String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev/';
  static final String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        var instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }

      return webtoonInstances;
    }
    throw Error();
  }
}
