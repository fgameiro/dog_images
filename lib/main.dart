import 'package:dog_images/ImagesList.dart';
import 'package:flutter/material.dart';
import 'Api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dog Images',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new FutureList());
  }
}

class FutureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick a dog breed!"),
      ),
      body: futureList(),
    );
  }

  Widget futureList() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container();
        }

        return createListView(context, snapshot);
      },
      future: API.getAllBreeds(),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    var breeds = snapshot.data?.breeds;
    if (breeds == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: breeds.length,
      itemBuilder: (BuildContext context, int index) {
        final String breed = breeds[index];
        return ListTile(
          title: Text(breed),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImagesList(
                          breed: breed,
                        )));
          },
        );
      },
    );
  }
}
