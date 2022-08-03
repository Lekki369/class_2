import 'package:class_2/views/chart_bar.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({
    required this.recentTransaction,
    Key? key,
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransaction.fold(0.0, (sVal, item) {
      return sVal + double.parse(item['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransaction);
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: data['day'].toString(),
                    spendingAmount: double.parse(data['amount'].toString()),
                    spendingPctOfTotal: maxSpending == 0.0
                        ? 0.0
                        : double.parse(data['amount'].toString()) /
                            maxSpending),
              );
            }).toList(),
          ),
        ));
  }
}
