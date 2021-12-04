import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final int dayExpense;
  final double dayExpensePercent;
  final String label;

  Bar(this.dayExpense, this.dayExpensePercent, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: 20, child: FittedBox(child: Text('₹${dayExpense}'))),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                FractionallySizedBox(
                  heightFactor: 1 - dayExpensePercent,
                  child: Container(
                      decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.black,
                    //   width: 1,
                    // ),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 0.8),
                  )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(label),
        ],
      ),
    );
  }
}
