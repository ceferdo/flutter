import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Minha linda aplicação",
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'MaterialApp Theme',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          body: Text('Ola flutter', style: TextStyle(color: Colors.amber)),
        ));
  }
}
