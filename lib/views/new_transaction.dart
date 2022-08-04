// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _inputTitle = TextEditingController();
  var _selectededDate;

  final _inputAmount = TextEditingController();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectededDate = pickedDate;
        });
      },
    );
  }

  void _submittedData() {
    if (_inputAmount.text.isEmpty) {
      return;
    }
    final enteredDataTitle = _inputTitle.text;
    final enteredDataAmount = double.parse(_inputAmount.text);

    if (enteredDataTitle.isEmpty ||
        enteredDataAmount < 0 ||
        _selectededDate == null) {
      return;
    }
    widget.call(
      enteredDataTitle,
      enteredDataAmount,
      _selectededDate,
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
            onSubmitted: (_) => _submittedData(),
            controller: _inputTitle,
            textInputAction: TextInputAction.next,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              _submittedData();
            },
            controller: _inputAmount,
            textInputAction: TextInputAction.done,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectededDate == null
                      ? 'No Date Chosen'
                      : DateFormat('EEE d-M-y').format(_selectededDate),
                ),
                FlatButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: RaisedButton(
            onPressed: _submittedData,
            child: const Text(
              'Add Transaction',
            ),
          ),
        )
      ]),
    );
  }
}
