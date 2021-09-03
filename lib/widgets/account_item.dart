import 'dart:async';

import 'package:finance_manager/provider/account_item_data.dart';
import 'package:finance_manager/screens/account_detail_screen.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatefulWidget {
  final AccountItemData accountItemData;
  AccountItem(this.accountItemData);

  @override
  _AccountItemState createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
  FutureOr onGoBack(dynamic value) {
    print("ON GO BACk");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          widget.accountItemData.title,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          widget.accountItemData.currentCash.toString() + "€",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(AccountDetailScreen.routeName,
                  arguments: widget.accountItemData.id)
              .then(onGoBack);
        },
      ),
    );
  }
}
