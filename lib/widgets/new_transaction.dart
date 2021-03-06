import 'package:finance_manager/models/transaction.dart';
import 'package:finance_manager/provider/account_item_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final AccountItemData accountData;
  final Function addTransaction;
  @override
  _NewTransactionState createState() => _NewTransactionState();
  NewTransaction(this.accountData, this.addTransaction);
}

class _NewTransactionState extends State<NewTransaction> {
  final _form = GlobalKey<FormState>();

  var _newTransaction = Transaction(date: DateTime.now());
  bool _isIncome = false;

  void _submitData() {
    final _isValid = _form.currentState?.validate();
    _form.currentState?.save();
    if (_isValid == false) {
      print("the form is not valid");
      return;
    }
    _setAmountSign();
    widget.addTransaction(_newTransaction, widget.accountData);
    Navigator.of(context).pop();
  }

  void _setAmountSign() {
    if (!_isIncome) {
      _newTransaction.amount = -_newTransaction.amount;
    }
  }

  void _changeDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 150)),
      lastDate: DateTime.now().add(Duration(days: 150)),
    ).then((newDate) {
      setState(() {
        if (newDate != null) {
          _newTransaction.date = newDate;
        }
      });
    });
  }

  String validation(String value, String message) {
    if (value.isEmpty) {
      return message;
    }
    return null;
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
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Text("Add new Transaction"),
                TextFormField(
                  decoration: InputDecoration(labelText: "Title"),
                  validator: (value) {
                    return validation(value, "Please enter a valid title!");
                  },
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _newTransaction.title = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Amount (???)"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validation(value, "Please enter a valid number!");
                  },
                  onSaved: (value) {
                    _newTransaction.amount = double.parse(value);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Income"),
                        Switch(
                            value: _isIncome,
                            onChanged: (val) {
                              setState(() {
                                _isIncome = val;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Text(DateFormat.yMMMd().format(_newTransaction.date)),
                        TextButton(
                            onPressed: () {
                              _changeDate(context);
                            },
                            child: Text("Change Date")),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: _submitData,
                  child: Text("Add new Transaction"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
