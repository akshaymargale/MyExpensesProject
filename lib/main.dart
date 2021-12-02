import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transactions.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTx(nTitle, nAmount) {
    final newTx = Transaction(
        id: (DateFormat.yMMMMd().add_Hms().format(DateTime.now()).toString()),
        title: nTitle,
        amount: nAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startNewTransaction(BuildContext ctx) {
    setState(() {
      showModalBottomSheet(
          context: ctx,
          builder: (bctx) {
            return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(
                _addNewTx,
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: [
            IconButton(
                onPressed: () => startNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startNewTransaction(context),
        ));
  }
}
