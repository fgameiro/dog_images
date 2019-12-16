import 'package:flutter/material.dart';
import 'BreedList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dog Images',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(15, 76, 129, 1.0),
        ),
        home: BreedList());
  }
}
