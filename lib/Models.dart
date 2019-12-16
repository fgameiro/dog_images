class Breeds {
  final List<String> breeds;

  Breeds({this.breeds});

  factory Breeds.fromJson(Map<String, dynamic> json) {
    var result = json['message'];
    List<String> allBreeds = [];

    for (var breed in result.keys) {
      allBreeds.add(breed);
    }

    return Breeds(breeds: allBreeds);
  }
}

class DogImages {
  final List<String> urls;

  DogImages({this.urls});

  factory DogImages.fromJson(Map<String, dynamic> json) {
    var result = json['message'];
    List<String> imageURLs = [];

    for (var url in result) {
      imageURLs.add(url);
    }

    return DogImages(urls: imageURLs);
  }
}
