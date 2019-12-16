import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Models.dart';

class API {
  static Future<Breeds> getAllBreeds() async {
    final String allBreedsURL = "https://dog.ceo/api/breeds/list/all";

    final response = await http.get(allBreedsURL);

    if (response.statusCode == 200) {
      var result = Breeds.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  static Future<DogImages> getImageURLs(String breed) async {
    final String imagesURLs = "https://dog.ceo/api/breed/$breed/images";

    final response = await http.get(imagesURLs);

    if (response.statusCode == 200) {
      var result = DogImages.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('Failed to load urls');
    }
  }
}
