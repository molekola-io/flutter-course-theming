import 'package:flutter/material.dart';
import 'package:molekola/main.dart';
import 'package:molekola/services/authentication_service.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  // Email
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();

  // Password
  final _passwordController = TextEditingController();
  final _passwordFocus = FocusNode();

  // Button
  final _submitFocus = FocusNode();

  void _authenticate() async {
    try {
      MyApp.ACCOUNT = await AuthenticationService.authenticate(
          _emailController.text, _passwordController.text);
      Navigator.pop(context);
      Navigator.of(context).pushNamed(HomePage.ROUTE);
    } catch (e) {
      print("Error Authenticating user: ${_emailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
          ),
          Image(
            image: AssetImage('assets/images/molekola-logo.png'),
            width: 200,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          ),
          TextFormField(
            controller: _emailController,
            focusNode: _emailFocus,
            textInputAction: TextInputAction.next,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
                labelText: "Email", helperText: "Please type your email here"),
            onFieldSubmitted: (value) {
              _emailFocus.unfocus();
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
          ),
          TextFormField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            textInputAction: TextInputAction.send,
            obscureText: true,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
                labelText: "Password",
                helperText: "Please type your password here"),
            onFieldSubmitted: (value) {
              _passwordFocus.unfocus();
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          ),
          MaterialButton(
            color: Colors.indigo,
            textColor: Colors.white,
            child: Text("Login"),
            onPressed: () {
              _authenticate();
            },
          )
        ],
      )),
    ));
  }
}
