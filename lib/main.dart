// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:class_2/views/transaction_list.dart';

import '../views/new_transaction.dart';

import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Shoes',
    ),
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Clothe',
    ),
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Drinks',
    ),
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Shoes',
    ),
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Shoes',
    ),
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Shoes',
    ),
    Transaction(
      amount: 20.0,
      date: DateTime.now(),
      id: 'a1',
      title: 'Shoes',
    )
  ];

  void _addNewTransacton(String title, double amount) {
    final newTx = Transaction(
      amount: amount,
      date: DateTime.now(),
      id: 'id',
      title: title,
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
              },
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(call: _addNewTransacton));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
        appBar: AppBar(
          title: Text('Personal'),
        ),
        body: SingleChildScrollView(
          //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.amberAccent,
                elevation: 2,
                child: Text('CHART'),
              ),
            ),
            TransactionList(transaction: _transactions)
          ]),
        ),
      ),
    );
  }
}
