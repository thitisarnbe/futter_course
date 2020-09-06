import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: transactions.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                Transaction transaction = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${transaction.amount}'),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete),
                            textColor: Theme.of(context).errorColor,
                            onPressed: () => deleteTransaction(transaction.id),
                            label: Text('Delete'),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTransaction(transaction.id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            )
          : LayoutBuilder(builder: (context, constrains) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            }),
    );
  }
}
