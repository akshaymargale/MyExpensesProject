import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Container(
            child: Column(
              children: [
                Text(
                  "No Transactions yet!!!",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    "images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text('₹${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      "${transactions[index].title}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(DateFormat.jm()
                        .add_MMMd()
                        .format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
          );
  }
}
