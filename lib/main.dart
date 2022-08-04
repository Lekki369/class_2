// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import '../views/transaction_list.dart';

import '../views/new_transaction.dart';

import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'views/chart.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

int idCount = 0;

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [];
  List<Transaction> get _recentTransaction {
    final tras = _transactions.where((transction) {
      return transction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    });
    return tras.toList();
  }

  void _addNewTransacton(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      amount: amount,
      date: chosenDate,
      id: (idCount++).toString(),
      title: title,
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      idCount--;

      _transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(call: _addNewTransacton));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        //  primaryColor: Colors.black12,
      ),
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
          child: _transactions.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: Center(
                    child: Image(
                      image: AssetImage(
                          'asset/—Pngtree—banking service concept in 3d_7601736.png'),
                    ),
                  ),
                )
              : Column(children: [
                  Chart(
                    recentTransaction: _recentTransaction,
                  ),
                  TransactionList(
                      transaction: _transactions,
                      removeTransaction: _removeTransaction)
                ]),
        ),
      ),
    );
  }
}
