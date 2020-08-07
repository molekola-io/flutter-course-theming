import 'package:flutter/material.dart';

class ReusableAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  ReusableAppBar({Key key, String title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        this.title = title,
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ReusableAppBarState createState() => _ReusableAppBarState(title);
}

class _ReusableAppBarState extends State<ReusableAppBar> {
  final String title;
  _ReusableAppBarState(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).backgroundColor,
      textTheme: Theme.of(context)
          .copyWith(accentColor: Theme.of(context).accentColor)
          .textTheme,
      iconTheme: Theme.of(context)
          .copyWith(accentColor: Theme.of(context).accentColor)
          .iconTheme,
    );
  }
}
