import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: () => deleteTx(transaction.id),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).errorColor),
              )
            : IconButton(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
