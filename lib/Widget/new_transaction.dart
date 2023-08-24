import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTrans;

  NewTransaction(this.newTrans);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _chosedDate = DateTime.now();

  void _Submition() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.newTrans(
        enteredTitle,
        enteredAmount,
        _chosedDate,
      );
      Navigator.of(context).pop();
    }
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _chosedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              onFieldSubmitted: (_) => _Submition,
            ),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (_) => _Submition(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      'Picked Date: ${DateFormat.yMMMd().format(_chosedDate)}'),
                ),
                TextButton(
                    onPressed: _datePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ))
              ],
            ),
            ElevatedButton(
              onPressed: _Submition,
              child: const Text(
                'Add transaction',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
