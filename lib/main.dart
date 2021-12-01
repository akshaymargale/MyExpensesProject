import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New shoes",
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Earphones",
      amount: 450,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "T-Shirt",
      amount: 800,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              color: Colors.grey,
              child: Text(
                "Chart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          Column(
            children: transactions
                .map((tx) => Card(
                      child: Text(tx.title),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
