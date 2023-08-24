import 'package:flutter/material.dart';
import '../transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Container(
              height: 100,
              padding: EdgeInsets.all(10),
              child: Text(
                'No transaction added yet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
        : Container(
            height: 550,
            child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'hi-IN', decimalDigits: 2)
                                  .format(transactions[index].amount),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: MediaQuery.of(context).size.width > 360 ?
                         TextButton.icon(onPressed: () => deleteTx(transactions[index].id), icon: Icon(Icons.delete, color: Colors.red,), label: Text('Delete', style: TextStyle(color: Colors.red),),)
                          : IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTx(transactions[index].id),
                        color: Colors.red,
                      ),
                    ),
                  );
                }));
  }
}
