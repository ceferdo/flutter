import 'package:flutter/material.dart';


void main() {
  runApp(ListaApp());
}

class ListaApp extends StatelessWidget {
  final TextStyle styleBase =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus amigos',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Olá Amigos'),
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ],
            ),
          )),
    );
  }
}
