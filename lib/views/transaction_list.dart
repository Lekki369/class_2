import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function removeTransaction;
  const TransactionList({
    required this.transaction,
    required this.removeTransaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: transaction.length,
        itemBuilder: (context, count) {
          return Card(
            child: Row(children: [
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.1)),
                padding: const EdgeInsets.all(5),
                child: Text(
                  '\$${transaction[count].amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  transaction[count].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                Text(
                  DateFormat('EEE d-M-y').format(transaction[count].date),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Theme.of(context).primaryColorLight),
                ),
              ]),
              const Spacer(flex: 2),
              IconButton(
                onPressed: () {
                  removeTransaction(transaction[count].id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
