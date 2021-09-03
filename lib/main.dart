import 'package:finance_manager/provider/account_list_data.dart';
import 'package:finance_manager/screens/account_detail_screen.dart';
import 'package:finance_manager/screens/home_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AccountListData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    fontFamily: "RobotoCondensed",
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline1: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoCondensed",
                    color: Colors.white,
                  ),
                  headline2: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoCondensed",
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline3: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoCondensed",
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                )),
        home: HomeOverviewScreen(),
        routes: {
          AccountDetailScreen.routeName: (ctx) {
            return AccountDetailScreen();
          },
          HomeOverviewScreen.routeName: (ctx) {
            return HomeOverviewScreen();
          }
        },
      ),
    );
  }
}
