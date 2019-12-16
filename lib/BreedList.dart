import 'package:flutter/material.dart';
import 'Api.dart';
import 'ImagesList.dart';
import 'CustomText.dart';

class BreedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Pick a dog breed!"),
      ),
      body: _futureList(),
      backgroundColor: Color.fromRGBO(15, 76, 129, 1.0),
    );
  }

  Widget _futureList() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container();
        }

        return _createListView(context, snapshot);
      },
      future: API.getAllBreeds(),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
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

        return _cardItem(context, breed);
      },
    );
  }

  Widget _cardItem(BuildContext context, String breed) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(15, 76, 129, 0.9),
        ),
        child: ListTile(
          title: Text(
            breed,
            style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImagesList(
                          breed: breed,
                        )));
          },
        ),
      ),
    );
  }
}
