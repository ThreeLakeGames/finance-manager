import 'package:finance_manager/models/transaction.dart';
import 'package:finance_manager/provider/account_item_data.dart';
import 'package:finance_manager/provider/account_list_data.dart';
import 'package:finance_manager/widgets/new_transaction.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AccountDetailScreen extends StatefulWidget {
  static const routeName = "/accountDetailScreen";

  @override
  _AccountDetailScreenState createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
  final List<PopupMenuItem> _transactionPopUpItems = [
    PopupMenuItem<String>(
      child: Row(
        children: [
          Icon(Icons.settings),
          Text("  edit"),
        ],
      ),
      value: "edit",
    ),
    PopupMenuItem<String>(
      child: Row(
        children: [
          Icon(Icons.delete),
          Text(" delete"),
        ],
      ),
      value: "delete",
    ),
  ];

  void startAddNewTransaction(BuildContext ctx, AccountItemData accountData) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return NewTransaction(accountData, addNewTransaction);
        });
  }

  void addNewTransaction(
      Transaction newTransaction, AccountItemData accountItemData) {
    setState(() {
      accountItemData.addTransaction(newTransaction);
    });
  }

  Widget buildTransactionTile(AccountItemData accountData, int i) {
    return Card(
      elevation: 7,
      child: ListTile(
        title: Text(
          accountData.transactions[i].title,
          style: Theme.of(context).textTheme.headline2,
        ),
        trailing: Container(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat.yMMMd().format(accountData.transactions[i].date)),
              PopupMenuButton(
                itemBuilder: (ctx) {
                  return _transactionPopUpItems;
                },
                onSelected: (val) {
                  if (val == "delete") {
                    setState(() {
                      accountData
                          .deleteTransaction(accountData.transactions[i]);
                    });
                  }
                },
              ),
            ],
          ),
        ),
        // Text(DateFormat.yMMMd()
        //     .format(accountData.transactions[i].date)),

        subtitle:
            Text(accountData.transactions[i].amount.toStringAsFixed(2) + "€"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountId = ModalRoute.of(context).settings.arguments as String;
    final accountData =
        Provider.of<AccountListData>(context).accountByID(accountId);
    return Scaffold(
      appBar: AppBar(
        title: Text(accountData.title,
            style: Theme.of(context).textTheme.headline1),
      ),
      body: Column(
        children: [
          Text("Budget: " + accountData.currentCash.toString() + "€",
              style: Theme.of(context).textTheme.headline3),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: accountData.transactions.length,
              itemBuilder: (ctx, i) {
                return buildTransactionTile(accountData, i);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransaction(context, accountData);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
