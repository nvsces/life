import 'package:financial_accounting/generated/l10n.dart';
import 'package:financial_accounting/models/user.dart';
import 'package:financial_accounting/services/auth_services.dart';
import 'package:financial_accounting/utilits/funs.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _loginC = TextEditingController();
  TextEditingController _passwordC = TextEditingController();
  bool showLogin = true;
  String labelText = "Зарегистрироваться";

  void _registrActions() async {
    final String email = _loginC.text.trim();
    final String password = _passwordC.text.trim();
    User user =
        await AuthService().registrWithEmailAndPassword(email, password);
  }

  void _loginActions() async {
    final String email = _loginC.text.trim();
    final String password = _passwordC.text.trim();
    User user = await AuthService().signInWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).app_bar_title,
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: _loginC,
                textAlign: TextAlign.center,
                decoration:
                    inputDecorationBuild(labelText: S.of(context).text_login)),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: _passwordC,
              decoration:
                  inputDecorationBuild(labelText: S.of(context).text_password),
            ),
          ),
          showLogin
              ? RaisedButton(
                  child: Text(S.of(context).text_input),
                  onPressed: _loginActions)
              : RaisedButton(
                  child: Text(S.of(context).text_registr),
                  onPressed: _registrActions),
          GestureDetector(
              onTap: () {
                setState(() {
                  showLogin = !showLogin;
                });
              },
              child: Text(showLogin ? "Зарегистрироваться" : "Войти"))
        ],
      ),
    );
  }
}
