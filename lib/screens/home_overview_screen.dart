import 'package:finance_manager/provider/account_list_data.dart';
import 'package:finance_manager/widgets/account_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontenmodell"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AccountListData>(context, listen: false).storeItems();
            },
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              Provider.of<AccountListData>(context, listen: false).loadItems();
            },
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: AccountList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
