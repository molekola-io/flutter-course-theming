import 'package:flutter/material.dart';
import 'package:molekola/main.dart';
import 'package:molekola/pages/info_page.dart';
import 'package:molekola/pages/organization_page.dart';

class ReusableDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReusableDrawerState();
}

class _ReusableDrawerState extends State<ReusableDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text("${MyApp.ACCOUNT.firstName} ${MyApp.ACCOUNT.lastName}"),
            accountEmail: Text(MyApp.ACCOUNT.email),
            currentAccountPicture:
                CircleAvatar(child: Icon(Icons.account_circle)),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Info"),
            onTap: () {
              Navigator.of(context).pushNamed(InfoPage.ROUTE);
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home Page"),
            onTap: () {
              Navigator.of(context).pushNamed(HomePage.ROUTE);
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text("Organizzazioni"),
            onTap: () {
              Navigator.of(context).pushNamed(OrganizationPage.ROUTE);
            },
          ),
        ],
      ),
    );
  }
}
