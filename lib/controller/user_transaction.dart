import '../models/transaction.dart';
import '../views/transaction_list.dart';
import 'package:flutter/material.dart';

import '../views/new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
    ),
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(call: _addNewTransacton),
      TransactionList(transaction: _transactions),
    ]);
  }
}
