import 'package:flutter/material.dart';

class CardMoney extends StatelessWidget {
  final dynamic data;
  final valorReal;

  CardMoney(this.data, this.valorReal);

  Widget build(BuildContext context) {
    print(this.data);
    return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Card(
          child: Column(
            children: [
              Text("Moeda: ${this.data["name"]}"),
              Text("Valor Venda: ${this.data["buy"]}"),
              Text("Valor Compra: ${this.data["sell"]}"),
              Text("Variação: ${this.data["variation"]}"),
            ],
          ),
        ));
  }
}