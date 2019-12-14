import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'BreedsModel.dart';

const baseURL = "https://dog.ceo/api/breeds/list/all";

class API {
  static Future<Breeds> getAllBreedsAlternative() async {
    final response = await http.get(baseURL);

    if (response.statusCode == 200) {
      var result = Breeds.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
