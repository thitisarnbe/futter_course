import 'package:flutter/material.dart';
import './transacion_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;

  UserTransaction(this.userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(userTransaction, deleteTransaction),
      ],
    );
  }
}
