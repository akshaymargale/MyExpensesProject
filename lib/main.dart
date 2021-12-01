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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: transactions
                .map((tx) => Row(
                      children: [
                        Container(
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.blueGrey,
                            width: 2,
                          )),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          child: Text(
                            tx.amount.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(tx.date.toString())
                          ],
                        )
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
