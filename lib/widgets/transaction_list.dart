import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTx;

  TransactionList(this._transactions, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    final selecteColor = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: ((context, constraints) {
      return Container(
        child: _transactions.isEmpty
            ? Column(
                children: <Widget>[
                  FittedBox(child: Text("No! Transaction Found")),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx /*context*/, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: selecteColor.primary,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(
                              '₹${_transactions[index].amount.toStringAsFixed(2)}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        _transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(_transactions[index].date),
                      ),
                      trailing: MediaQuery.of(context).size.width > 400
                          ? TextButton.icon(
                              onPressed: () =>
                                  _deleteTx(_transactions[index].id),
                              icon: Icon(Icons.delete),
                              label: FittedBox(
                                child: Text(
                                  "Remove",
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  primary: selecteColor.secondary),
                            )
                          : IconButton(
                              icon: Icon(Icons.delete),
                              color: selecteColor.secondary,
                              onPressed: () =>
                                  _deleteTx(_transactions[index].id)),
                    ),
                  );
                },
                itemCount: _transactions.length,
              ),
      );
    }));
  }
}
