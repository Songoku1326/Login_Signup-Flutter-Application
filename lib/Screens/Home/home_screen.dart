import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task3/Screens/Account/account_screen.dart';
import 'package:task3/Screens/Home/components/body.dart';

import '../global.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.lightGreen[600]),
              accountName: Text(gname),
              accountEmail: Text(gemail),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                ),
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).canvasColor,
              ),
              onDetailsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AccountScreen();
                    },
                  ),
                );
              },
              arrowColor: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
          ),
          ListTile(
            title: Text("Order History"),
            leading: Icon(Icons.list),
            onTap: () {},
          ),
          ListTile(
            title: Text("Help & Support"),
            leading: Icon(Icons.phone),
            onTap: () {},
          ),
          ListTile(
            title: Text("Updates"),
            leading: Icon(Icons.update),
            onTap: () {},
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.power),
            onTap: logout,
          ),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
        title: Text(
          'Home Screen',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Body(),
    );
  }

  void logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Log out alert!!"),
              content: Text("Are you sure, you want to Log out?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: Text('No')),
                ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Yes, Log out')),
              ],
            ));
    setState(() {});
  }
}
