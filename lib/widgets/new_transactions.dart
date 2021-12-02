import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    if ((!titleController.text.isEmpty) &&
        (!amountController.text.isEmpty) &&
        (int.parse(amountController.text) > 0)) {
      final intitle = titleController.text;
      final inAmount = int.parse(amountController.text);
      addTx(titleController.text, int.parse(amountController.text));
    }
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
                elevation: 10,
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.grey,
                onPressed: submitData)
          ],
        ),
      ),
    );
  }
}
