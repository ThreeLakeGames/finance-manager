import 'package:finance_manager/provider/account_list_data.dart';
import 'package:finance_manager/widgets/account_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accountList = Provider.of<AccountListData>(context).accountList;
    return ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (ctx, i) {
          return AccountItem(accountList[i]);
        });
  }
}
