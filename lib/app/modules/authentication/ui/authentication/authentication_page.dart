import 'package:flutter/material.dart';

import 'widgets/authentication_form_widget.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FlutterLogo(
                  size: 180.0,
                  style: FlutterLogoStyle.stacked,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AuthenticationFormWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
