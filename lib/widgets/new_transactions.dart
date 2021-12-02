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
      addTx(intitle, inAmount);
    }
  }

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
