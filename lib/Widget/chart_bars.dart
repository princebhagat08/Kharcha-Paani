import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBars extends StatelessWidget {
  final String lable;
  final double expanses;
  final double expensesPercent;

  ChartBars(this.lable, this.expanses, this.expensesPercent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: [
          Container(
            height: constrains.maxHeight * 0.15,
            child: FittedBox(
              child: Text(
                  NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 1)
                      .format(expanses)),
            ),
          ),
          SizedBox(
            height: 0.05,
          ),
          Container(
            height: constrains.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: expensesPercent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 0.05,
          ),
          Container(height: constrains.maxHeight * 0.15, child: Text(lable)),
        ],
      );
    });
  }
}
