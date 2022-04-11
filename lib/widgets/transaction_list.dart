import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTx;

  TransactionList(this._transactions, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text("No! Transaction Found"),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
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
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).accentColor,
                        onPressed: () => _deleteTx(_transactions[index].id)),
                  ),
                );

                // Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColorDark,
                //             width: 2,
                //           ),
                //         ),
                //         child: Text(
                //           "₹ ${_transactions[index].amount.toStringAsFixed(2)}",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Theme.of(context).primaryColorDark,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             _transactions[index].title,
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             DateFormat.yMMMd()
                //                 .format(_transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
