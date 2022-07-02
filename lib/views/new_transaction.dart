// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function call;
  NewTransaction({
    required this.call,
    Key? key,
  }) : super(key: key);
  final inputTitle = TextEditingController();
  final inputAmount = TextEditingController();

  void submitted() {
    final enteredData = inputAmount.text;
    final enteredDataAmount = double.parse(inputAmount.text);

    if (enteredData.isEmpty && enteredDataAmount < 0) {
      return;
    }
    call(
      enteredData,
      enteredDataAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white70,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            onSubmitted: (_) => submitted(),
            controller: inputTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitted(),
            controller: inputAmount,
          ),
        ),
        FlatButton(
          onPressed: submitted,
          textColor: Colors.green[700],
          child: const Text(
            'Add Transaction',
          ),
        )
      ]),
    );
  }
}
