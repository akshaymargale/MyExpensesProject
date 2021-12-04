import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int totalSum = 0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).toString()[0],
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalWeekExpense {
    return groupTransactionValues.fold(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: Bar(
                tx['amount'],
                (tx['amount'] == 0
                    ? 0.0
                    : ((tx['amount'] as int) / totalWeekExpense)),
                tx['day'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
