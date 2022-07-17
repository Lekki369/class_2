// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function call;
  const NewTransaction({
    required this.call,
    Key? key,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputTitle = TextEditingController();

  final inputAmount = TextEditingController();

  void submitted() {
    final enteredDataTitle = inputTitle.text;
    final enteredDataAmount = double.parse(inputAmount.text);

    if (enteredDataTitle.isEmpty && enteredDataAmount < 0) {
      return;
    }
    widget.call(
      enteredDataTitle,
      enteredDataAmount,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      //   color: Colors.white70,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            onSubmitted: (_) => submitted(),
            controller: inputTitle,
            textInputAction: TextInputAction.next,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              submitted();
            },
            controller: inputAmount,
            textInputAction: TextInputAction.done,
          ),
        ),
        FlatButton(
          onPressed: submitted,
          // textColor: Colors.green[700],
          child: const Text(
            'Add Transaction',
          ),
        )
      ]),
    );
  }
}
