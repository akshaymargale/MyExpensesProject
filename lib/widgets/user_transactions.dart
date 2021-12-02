import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'package:intl/intl.dart';
import './new_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransactions = [
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
      userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTx),
        TransactionList(userTransactions),
      ],
    );
  }
}
