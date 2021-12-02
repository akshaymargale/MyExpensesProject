import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _userTransactions
          .map((tx) => Row(
                children: [
                  Container(
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.blueGrey,
                      width: 2,
                    )),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "₹${tx.amount}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.jm().add_MMMEd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ))
          .toList(),
    );
  }
}
