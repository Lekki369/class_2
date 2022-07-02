// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:class_2/controller/user_transaction.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // String? inputTitle;
  // String? inputAmount;

  //final List<Transaction> transaction = [

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('data'),
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
            UserTransaction()
          ]),
        ),
      ),
    );
  }
}
