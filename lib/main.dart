import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.grey,
                  child: Text(
                    "Chart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ));
  }
}
