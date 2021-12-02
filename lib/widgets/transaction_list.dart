import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
            itemCount: _userTransactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: Row(
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
                        "₹${_userTransactions[index].amount}",
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
                          _userTransactions[index].title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.jm()
                              .add_MMMEd()
                              .format(_userTransactions[index].date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
