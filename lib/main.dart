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
      body: projectWidget(),
    );
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container();
        }

        return createListView(context, snapshot);
      },
      future: API.getAllBreedsAlternative(),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    var breeds = snapshot.data.breeds;
    return new ListView.builder(
      itemCount: breeds.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(breeds[index]),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
