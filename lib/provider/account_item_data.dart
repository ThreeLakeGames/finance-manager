import 'package:finance_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountItemData with ChangeNotifier {
  final String id;
  String title;
  double currentCash;
  List<Transaction> _transactions = [
    Transaction(title: "Kellerwirt", amount: 17),
    Transaction(title: "Müllnerbräu", amount: 45),
    Transaction(title: "Anoth It is another Git test", amount: 32)

  ];

  AccountItemData({
    this.id = "",
    this.title = "",
    this.currentCash = 0,
  });

  List<Transaction> get transactions {
    return [..._transactions];
  }

  void deleteTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }

  void addTransaction(Transaction newTransaction) {
    currentCash -= newTransaction.amount;
    _transactions.add(newTransaction);
    notifyListeners();
  }

  void storeItem() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(id + "title", title);
    prefs.setDouble(id + "currentCash", currentCash);
  }
}
