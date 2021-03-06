import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime datePicked;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || datePicked == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      datePicked,
    );
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((inDate) {
      setState(() {
        datePicked = inDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Text(
                    (datePicked == null)
                        ? "No date chosen."
                        : DateFormat.yMMMd().format(datePicked),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: RaisedButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        "Select Time",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
