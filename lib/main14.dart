import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));
}

final realController = TextEditingController();

Future<Map> getData() async {
  String request = "https://api.hgbrasil.com/finance?format=json&key=ea886132";
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cotação de moedas",
      home: Scaffold(
        appBar: AppBar(title: Text("Conversor de moedas")),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: realController,
                textAlign: TextAlign.center,
                style: style,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 5.0,
              ),
              RaisedButton(
                child: Text("Cotação"),
                onPressed: () {
                  setState(() {});
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
              FutureBuilder<Map>(
                  future: getData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text("wait"));
                      case ConnectionState.waiting:
                        return Center(
                            child: Text(
                          "Aguarde...",
                          style: TextStyle(color: Colors.green, fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ));
                      default:
                        if (snapshot.hasError) {
                          return Center(child: Text("error"));
                        }
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Card(
                                child: Text((snapshot.data["results"]
                                            ["currencies"]["USD"]["buy"] *
                                        double.parse(realController.text))
                                    .toString()),
                              ),
                              new Card(
                                child: Text((snapshot.data["results"]
                                            ["currencies"]["EUR"]["buy"] *
                                        double.parse(realController.text))
                                    .toString()),
                              ),
                              new Card(
                                child: Text((snapshot.data["results"]
                                            ["currencies"]["GBP"]["buy"] *
                                        double.parse(realController.text))
                                    .toString()),
                              ),
                            ],
                          ),
                        );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
