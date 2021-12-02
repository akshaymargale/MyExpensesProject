import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            RaisedButton(
                elevation: 10,
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.grey,
                onPressed: () {
                  addTx(titleController.text, int.parse(amountController.text));
                })
          ],
        ),
      ),
    );
  }
}
