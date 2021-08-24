import 'package:finance_manager/provider/account_item_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountListData with ChangeNotifier {
  List<AccountItemData> _accountList = [
    AccountItemData(
      currentCash: 195,
      id: "1",
      title: "SpassKonto",
    ),
    AccountItemData(
      currentCash: 225,
      id: "2",
      title: "Essen-Konto",
    ),
    AccountItemData(
      currentCash: 395,
      id: "3",
      title: "Anfallendes",
    ),
  ];

  List<String> storedAccountIDList = [];
  List<AccountItemData> get accountList {
    return [..._accountList];
  }

  void deleteAccount(AccountItemData accountItemData) {
    _accountList.remove(accountItemData);
    notifyListeners();
  }

  void storeItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    storedAccountIDList.clear();
    _accountList.forEach((accountItem) {
      storedAccountIDList.add(accountItem.id);
    });
  }

  AccountItemData accountByID(String id) {
    return _accountList.firstWhere((account) => account.id == id);
  }
}
