// @dart=2.9
import 'dart:convert';

import 'package:finance_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountItemData with ChangeNotifier {
  final String id;
  String title;
  double currentCash;
  List<Transaction> _transactions = [];

  AccountItemData({
    this.id = "",
    this.title = "",
    this.currentCash = 0,
  });

  List<Transaction> get transactions {
    return [..._transactions];
  }

  void deleteTransaction(Transaction transaction) {
    currentCash -= transaction.amount;
    _transactions.remove(transaction);
    notifyListeners();
  }

  void addTransaction(Transaction newTransaction) {
    currentCash += newTransaction.amount;
    _transactions.add(newTransaction);
    notifyListeners();
  }

  void initTransactions(List<String> transactionList) {
    _transactions.clear();
    transactionList.forEach((transactionString) {
      final loadedTransaction =
          Transaction.fromJson(jsonDecode(transactionString));
      _transactions.add(loadedTransaction);
    });
    notifyListeners();
  }

  void storeItem() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(id + "title", title);
    prefs.setDouble(id + "currentCash", currentCash);
    prefs.setStringList(id + "transactions", transactionStringList);
  }

  List<String> get transactionStringList {
    List<String> transactionStringData = [];
    _transactions.forEach((transaction) {
      transactionStringData.add(json.encode(transaction.toJson()));
    });
    return transactionStringData;
  }

  int get daysLeft {
    final dateNow = DateTime.now();
    final daysInMonth = DateUtils.getDaysInMonth(dateNow.year, dateNow.month);
    return daysInMonth - dateNow.day;
  }
}
