import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:user_authentication_flutter/app/modules/authentication/ui/authentication/controller/authentication_controller.dart';

class AuthenticationFormWidget extends StatefulWidget {
  const AuthenticationFormWidget({Key? key}) : super(key: key);

  @override
  _AuthenticationFormWidgetState createState() =>
      _AuthenticationFormWidgetState();
}

class _AuthenticationFormWidgetState extends State<AuthenticationFormWidget> {
  TextEditingController? userController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  late AuthenticationController authenticationController;

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: userController,
              decoration: InputDecoration(
                hintText: 'Usuário',
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Senha',
                prefixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: authenticationController.authenticateUser,
            child: Text('ENTRAR'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
