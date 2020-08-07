import 'package:flutter/material.dart';
import 'package:molekola/main.dart';
import 'package:molekola/models/heading_model.dart';
import 'package:molekola/services/authentication_service.dart';
import 'package:molekola/services/heading_service.dart';
import 'package:molekola/widgets/reusable_appbar.dart';

class OrganizationPage extends StatefulWidget {
  static String ROUTE = "/organizations";
  final String title = "Organizations";
  @override
  _OrganizationPageState createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  List<Heading> _organizations;

  @override
  void initState() {
    super.initState();
    _initOrganizations();
  }

  _initOrganizations() async {
    List<Heading> data = await HeadingService.load();
    setState(() {
      _organizations = data;
    });
  }

  _updateHeading(Heading heading) async {
    AuthenticationService.switchHeading(heading);
    setState(() {});
  }

  Widget _getPrintedOrganizations() {
    if (_organizations == null || _organizations.isEmpty) {
      return Container(
        child: Center(child: Text("Non ci sono organizzazioni da mostrare!")),
      );
    } else {
      return Column(
        children: _organizations
            .map((h) => ListTile(
                  title: Text(h.name),
                  subtitle: Text(h.role),
                  leading: h.id == MyApp.ACCOUNT.activeHeading.id
                      ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).accentIconTheme.color,
                        )
                      : Icon(Icons.fiber_manual_record),
                  onTap: () => _updateHeading(h),
                ))
            .toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: widget.title,
      ),
      body: SingleChildScrollView(
        child: _getPrintedOrganizations(),
      ),
    );
  }
}
