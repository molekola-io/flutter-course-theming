import 'package:flutter/material.dart';
import 'package:molekola/config/molekola_colors.dart';
import 'package:molekola/pages/info_page.dart';
import 'package:molekola/pages/organization_page.dart';
import 'package:molekola/pages/splash_page.dart';
import 'package:molekola/models/account_model.dart';
import 'package:molekola/widgets/reusable_appbar.dart';
import 'package:molekola/widgets/reusable_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Account ACCOUNT;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Molekola',
        theme: ThemeData(
          primarySwatch: MolekolaColors.indigo,
          accentColor: MolekolaColors.indigoAccent,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: SplashPage.ROUTE,
        routes: {
          SplashPage.ROUTE: (ctx) => SplashPage(),
          HomePage.ROUTE: (ctx) => HomePage(),
          InfoPage.ROUTE: (ctx) => InfoPage(),
          OrganizationPage.ROUTE: (ctx) => OrganizationPage(),
        });
  }
}

class HomePage extends StatefulWidget {
  static String ROUTE = "/";
  final String title = "Home Page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: ReusableAppBar(
        title: widget.title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      drawer: ReusableDrawer(),
    );
  }
}
