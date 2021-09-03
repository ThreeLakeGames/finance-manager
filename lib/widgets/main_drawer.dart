import 'package:finance_manager/screens/home_overview_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 24,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text(
              "Account-Model",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
          ),
          buildListTile("Home", Icons.home, () {
            Navigator.pushReplacementNamed(
                context, HomeOverviewScreen.routeName);
          }),
          Divider(),
          buildListTile("Stats", Icons.trending_up, () {
            // Navigator.pushReplacementNamed(context, ChartScreen.routeName);
          }),
          Divider(),
        ],
      ),
    );
  }
}
