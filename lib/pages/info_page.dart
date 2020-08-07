import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  static String ROUTE = '/info';

  @override
  State<StatefulWidget> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informazioni"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      //drawer: ReusableDrawer(),
    );
  }
}
