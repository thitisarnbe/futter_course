import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmonth;
  final double spendingPctOfTotalh;

  ChartBar(this.label, this.spendingAmonth, this.spendingPctOfTotalh);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return LayoutBuilder(builder: (context, constrains) {
      return Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              child: Text('\$ ${spendingAmonth.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.05,
          ),
          Container(
            height: constrains.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotalh,
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
            height: constrains.maxHeight * 0.05,
          ),
          Container(
            height: constrains.maxHeight * 0.15,
            child: FittedBox(
              child: Text(
                label,
                style: TextStyle(fontSize: 20 * curScaleFactor),
              ),
            ),
          ),
        ],
      );
    });
  }
}
