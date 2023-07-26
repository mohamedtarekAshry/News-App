// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Data/Models/all_news/all_news.dart';

class AllNewRepo {
  Future<AllNews?> getAllNew() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2023-06-26&sortBy=publishedAt&apiKey=65dd28f5c29344a8a3f981ae4ae1502f"));

      Map<String, dynamic> deCodeResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        AllNews data = AllNews.fromJson(deCodeResponse);

        return data;
      } else {
        print("Requist faild");
        return null;
      }
    } catch (error) {
      print("Error : $error ");
    }
    return null;
  }
}
