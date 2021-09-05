import 'package:finance_manager/provider/account_list_data.dart';
import 'package:finance_manager/widgets/account_list.dart';
import 'package:finance_manager/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeOverviewScreen extends StatefulWidget {
  static const routeName = "/home-overview-screen";

  @override
  _HomeOverviewScreenState createState() => _HomeOverviewScreenState();
}

class _HomeOverviewScreenState extends State<HomeOverviewScreen> {
  @override
  void initState() {
    Provider.of<AccountListData>(context, listen: false).loadItems();
    super.initState();
  }

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
        ],
      ),
      drawer: MainDrawer(),
      body: AccountList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
