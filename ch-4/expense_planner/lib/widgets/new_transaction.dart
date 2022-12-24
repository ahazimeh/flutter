import 'dart:io';

import 'package:expense_planner/widgets/adaptive_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx, {super.key}) {
    print('Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState() {
    print('Create NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate = null;

  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    super.initState();
    print('initState()');
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  void _submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final _enteredTitle = titleController.text;
    final _enteredAmount = double.parse(amountController.text);
    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      _enteredTitle,
      _enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                // onChanged: (val) {
                //   titleInput = val;
                // },
                controller: titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                // onChanged: (val) {
                //   amountInput = val;
                // },
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'no date chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                  ),
                  AdaptiveTextButton(
                    'Choose Date',
                    _presentDatePicker,
                  ),
                ]),
              ),
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).textTheme.button?.color
                    // foregroundColor: Colors.white,
                    ),
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
