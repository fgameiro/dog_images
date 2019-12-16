import 'package:dog_images/api.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesList extends StatelessWidget {
  final String breed;

  ImagesList({Key key, @required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed),
      ),
      body: getImages(),
    );
  }

  Widget imageGrid(BuildContext context, AsyncSnapshot snapshot) {
    List<String> urlList = snapshot.data?.urls;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double spacing = 4.0;
    final double imageSize = (mediaQueryData.size.width - (3 * spacing)) / 2;

    if (urlList == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    List<Widget> imageGridList = [];

    for (var url in urlList) {
      imageGridList.add(
        Stack(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: url,
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      padding: EdgeInsets.all(spacing),
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      children: imageGridList,
    );
  }

  Widget getImages() {
    return FutureBuilder(
      future: API.getImageURLs(breed),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return CircularProgressIndicator();
        }

        return imageGrid(context, snapshot);
      },
    );
  }
}
